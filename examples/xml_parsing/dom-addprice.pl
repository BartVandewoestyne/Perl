#!/usr/bin/perl -w
# dom-addprice -- add price element to books
#
# References:
#   [1] http://docstore.mik.ua/orelly/perl4/cook/ch22_03.htm

use XML::LibXML;
use Data::Dumper;
use strict;

my $parser = XML::LibXML->new;
my $dom = $parser->parse_file("books.xml") or die;
my $root = $dom->documentElement;

# get list of all the "book" elements
my @books = $root->getElementsByTagName("book");

foreach my $book (@books) {
  my $price = sprintf("\$%d.95", 19 + 5 * int rand 5); # random price
  my $price_text_node = $dom->createTextNode($price);  # contents of <price>
  my $price_element   = $dom->createElement("price");  # create <price>
  $price_element->appendChild($price_text_node);       # put contents into <price>
  $book->appendChild($price_element);                  # put <price> into <book>
}

print $dom->toString;
