use Win32::File::VersionInfo;
my $foo = GetFileVersionInfo ( "D:\\SVN\\xdsracu\\iConnect\\Apps\\ICDeviceServer.exe" );
if ( $foo ) {
      print $foo->{FileVersion}, "\n";
      my $lang = ( keys %{$foo->{Lang}} )[0];
      if ( $lang ) {
              print $foo->{Lang}{$lang}{CompanyName}, "\n";
      }
      ...
}
