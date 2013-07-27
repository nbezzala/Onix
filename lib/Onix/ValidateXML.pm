package Onix::ValidateXML;

use Moose;
use XML::LibXML;
use Try::Tiny;
use lib "$FindBin::Bin/../lib";

has 'dir' => ( isa => 'Str', is => 'rw', );
has 'xml' => ( isa => 'Str', is => 'rw', );
has 'xsd' => ( isa => 'Str', is => 'rw', );
			
sub BUILD {
	my $self = shift;
	my $xml	 = shift;

	$self->xsd("$FindBin::Bin/..//ONIX_Books_3.0_sample_1/reference.xsd");
}

sub validate {
	my $self = shift;

	my $schema = XML::LibXML::Schema->new(location => $self->xsd);
	my $parser = XML::LibXML->new;
	my $doc = $parser->parse_file($self->xml);

	eval { $schema->validate($doc) };

	if ( my $ex = $@ ) {
		return 1; # Valid XML
	} else {
		return 0; #Invalid
	}
}

1;
