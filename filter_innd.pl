#ctlinnd reload filter.perl reason
# global md5 stuff
   eval {require MD5; $md5 = new MD5};
   my %md5EMP;

sub filter_art {

    my $seentest = 0;
    my $seennontest = 0;

    # break out newsgroups into an array
    my @groups = split /[,\s]+/, $hdr{'Newsgroups'};
    my @followups = split /[,\s]+/, $hdr{'Followup-To'};

    foreach $group (@groups){
        $groups{$group} = '1';
    }
    foreach $group (@followups){
        $followups{$group} = '1';
    }

    # Vrijgeleide
    if ($hdr{'Newsgroups'} =~ /^muc\.lists\.[\w-.]+$/ ||
        $hdr{'Newsgroups'} =~ /^gateway\.[\w-.]+$/ ||
        exists $hdr{'X-Nadmin'}){
        return '';
    }

    # Crossposts
    if ($#{@groups} >= 3) {
        return "ECP: teveel nieuwsgroepen";
    }
    if ($#{@followups} >= 3) {
        return "ECP: teveel followup groepen";
    }
    foreach $group (@groups){
        if ($group =~ /\.test$/){
            $seentest = $group;
        }else{
            $seennontest = $group;
        }
#        while ($group =~ s/^((.+)\.[^.]+)$/$2/){
#            if (exists $groups{$group}){
#                return "ECP: posten naar $1 en $group overbodig";
#            }
#            if (exists $groups{"$group.misc"}){
#                return "ECP: posten naar $1 en $group.misc overbodig";
#            }
#        }
    }
    foreach $group (@followups){
        if ($group =~ /\.test$/){
            $seentest = $group;
        }else{
            $seennontest = $group;
        }
#        while ($group =~ s/^((.+)\.[^.]+)$/$2/){
#            if (exists $followups{$group}){
#                return "ECP: followups naar $1 en $group overbodig";
#            }
#            if (exists $followups{"$group.misc"}){
#                return "ECP: followups naar $1 en $group.misc overbodig";
#            }
#        }
    }


    ## Lege post (1 lijn ref + citaat)
    #if ($hdr{'__BODY__'} =~ /^\n*(.*(wrote|schreef).*)?(\n*([>:|].*)|(\s*))*$/){
    #   return "Bevat geen tekst, enkel citaat";
    #}
##
#    # Te lange lijnen
#    if ($hdr{'__BODY__'} =~ /\n.{81}/){
#       return "Bevat lijnen langer dan 80 karakters";
#    }

    # Non-ascii posts 
    if ($hdr{'__BODY__'} =~ /\n[Cc]ontent-[Tt]ype: text\/html/){
       return "NAP: Ik eet geen HTML posts.";
    }
    if ($hdr{'__BODY__'} =~ /doctype\ html/){
       return "NAP: Ik eet geen HTML posts.";
    }
    if (($hdr{'__BODY__'} =~ /begin\ 6(4|6){2}\ [A-Za-z0-9\ ]*?\.vcf/i) 
	|| ($hdr{'__BODY__'} =~ /\n[Cc]ontent-[Tt]ype: text\/x-vcard/)) {
       return "NAP: Ik eet geen vcards.";
    }
    if ($hdr{'Content-Type'} =~ /^multipart\/signed/){
       return "NAP: Ik eet geen signed boodschappen.";
    }
    if ($hdr{'Content-Type'} =~ /\.vcf/){
       return "NAP: Ik eet geen signed boodschappen.";
    }

    # Eruit met die rommel
    if ($hdr{'__BODY__'} =~ /[Hh]appy99.exe/){
       return "NAP: Ik eet geen happy99.";
    }

    # door de lieven erbij gezet (lieven pissed)
    #if ($hdr{'__BODY__'} =~ /lieven.*.jpg/i){
    #   return "NAP: Denk eerst eens na aub.";
    #}
    
    #if ($hdr{'Cache-Post-Path'} =~ /kn-10-0-44-012/i) {
    #   return "http://www.kotnet.kuleuven.ac.be/aup.html (verdere info bij lieven\@vtk.be)";
    #}

    #if ($hdr{'Cache-Post-Path'} =~ /tvd-10-67-118-008/i || $hdr{'From'} =~ /kris.janssen1/i || $hdr{'From'} =~ /janssenkris/i) {
    #   return "http://www.kotnet.kuleuven.ac.be/n_aup.html (verdere info bij jos\@kotnet.org)";
    #}

    # MMF: Make money fast
    if ($hdr{'__BODY__'} =~ /hotrate/){
       return "MMF: Liever geen hotrate spam op kotnet.";
    }
    # hospedagem spammer
    if ($hdr{'From'} =~ /hospedagem/){
       return "NAP: Liever geen hospedagem spam op kotnet.";
    }
    # jos wou iets over alladv posten en misbruikt zijn powers ;-)
    #if ($hdr{'__BODY__'} =~ /alladvantage/){
    #   return "MMF: Liever geen alladvantage spam op kotnet.";
    #}
    

    # Domme attachments
    if ($hdr{'__BODY__'} =~ /begin\ 6(4|6){2}\ [A-Za-z0-9\-\ ]*?\.e(x|ks)e/i){
       return "NAP: Gebruik ftp om dit soort files uit te wisselen.";
    }
    if ($hdr{'__BODY__'} =~ /name=\"[A-Za-z0-9\-\ ]*?\.e(x|ks)e/i){
       return "NAP: Gebruik ftp om dit soort files uit te wisselen.";
    }
    if ($eennontest && ($hdr{'__BODY__'} =~ /application\/x-zip-compressed/i)){
       return "NAP: Gebruik ftp om dit soort files uit te wisselen.";
    }
    if ($eennontest && ($hdr{'__BODY__'} =~ /begin\ 6(4|6){2}\ [A-Za-z0-9\-\ \_]*?\.(z|s)ip/i)){
       return "NAP: Gebruik ftp om dit soort files uit te wisselen.";
    }
    if ($eennontest && (($hdr{'__BODY__'} =~ /application\/octet-stream/i) && ($hdr{'__BODY__'} =~ /\.e(x|ks)e/i))){
       return "NAP: Gebruik ftp om dit soort files uit te wisselen.";
    }
    if ($eennontest && ($hdr{'__BODY__'} =~ /application\/x-zip-compressed/i)){
       return "NAP: Gebruik ftp om dit soort files uit te wisselen.";
    }
    if ($hdr{'__BODY__'} =~ /begin\ 6(4|6){2}\ [A-Za-z0-9\-\ \_]*?\.(doc|xls|ppt|bmp|psp|ppt|pps)/i){
       return "NAP: Ongewenst type attachments. Crossplatvorm alternatieven beschikbaar.";
    }
    #if ($hdr{'__BODY__'} =~ /application\/(msword|msexcel)/i){
    #   return "NAP: Geen doc attachments. Crossplatvorm alternatieven beschikbaar.";
    #}
    if ($hdr{'__BODY__'} =~ /begin\ 6(4|6){2}\ [A-Za-z0-9\-\ ]*?\.txt/i){
       return "NAP: Tekst meeplakken leest makkelijker.";
    }
    if ($hdr{'__BODY__'} =~ /begin\ 6(4|6){2}\ [A-Za-z0-9\-\ \_]*?\.(wav|waf|mpg|mpeg|mp3|mpdrie|swf|fla|asf)/i){
       return "NAP: Voor multimedia bestanden hebben we helaas geen plaats.";
    }

    # Multiposts
#    if ($seennontest && defined $md5) {
#         $md5hash = $md5->hexhash($hdr{'__BODY__'});
#         if (exists $md5EMP{$md5hash}) {
#             return "EMP: dit eigenste artikel werd reeds gepost";
#         }
#     }
 
     # Cheap subjects
      $hdr{'Subject'} =~ s/^\s*([Rr][Ee]:)?\s*//;
#     if (length($hdr{'Subject'})>60){
#         return "CSP: Subject te lang";
#     }
#     if ($hdr{'Subject'} =~ /([?!.,]{4,})/){
#         return "CSP: Subject bevat teveel leestekens $1";
#     }
#     $hdr{'Subject'} =~ s/[\s.?!]*$//;
#     $hdr{'Subject'} =~ s/[,!?.]/ /g;
#     $hdr{'Subject'} =~ s/\bignore\b//i;
#

          if (($hdr{'Subject'} =~ /[A-Z]{5,}/)
	       && ($hdr{'Subject'} !~ /ULYSSIS/)
	       && ($hdr{'Subject'} !~ /HTML/)
	       &&($hdr{'Newsgroups'} !~ /kuleuven\./)&&($hdr{'Newsgroups'} !~ /examen/)){
              return "CSP: Te veel hoofdletters in subject. Niet roepen, we zijn niet doof.";
          }

     
      if ($seennontest && $hdr{'Newsgroups'} !~ /^kotnet\.klachten$/){
#         if ($hdr{'Subject'} =~ /\bplea[sz]e?\b/i){
#             return "CSP: Don't say please, please";
#         }
          if ($hdr{'Subject'} =~ /^\s*test\s*$/i){
              return "CSP: Tests horen in kotnet.test, niet $seennontest";
          }
          #if ($hdr{'Subject'} =~ /^\s*([A-Z]{5,}\s*)+$/){
          #if ($hdr{'Subject'} =~ /[A-Z]{5,}/){
#          if (($hdr{'Subject'} =~ /[A-Z]{5,}/)&&($hdr{'Subject'} !~ /HTML/)
#	       &&($hdr{'Newsgroups'} !~ /kuleuven\./)&&($hdr{'Newsgroups'} !~ /examen/)){
 #             return "CSP: Te veel hoofdletters in subject. Niet roepen, we zijn niet doof.";
  #        }
          #if ($hdr{'__BODY__'} =~ /[A-Z]{6,}/){
      	  #    return "CSP: Te veel hoofdletters in body. Niet roepen, we zijn niet doof.";
          #}
#         #matches single words and empty string
#         if ($hdr{'Subject'} =~ /^\s*(vraa?g((j|sk)es?)?(en)?|problee?m((k|pj)es
#?)?(en)?|oplossing|gezocht|merci|sorr(y|ie)|(be)?dankt?|addicted2bullshit|h[eu]lp)?\s*$/i){
#
#            return "CSP: Subject moet duidelijker";
#         }
      }
#
    if ($md5hash) {$md5EMP{$md5hash} = 1};
    return '';

}
