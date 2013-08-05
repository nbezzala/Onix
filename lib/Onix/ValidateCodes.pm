package Onix::ValidateCodes;

use Moose::Role;
use Text::CSV;
use Data::Dumper;

=head2
Read a CSV file which lists all the codes
Create a hash of hashes
The hash has the code list numbers as the keys, 
Each code list in turn has a hash where the code value is 1 if it is valid. 
We can use this hash to check if the XML has used valid codes.
=cut

sub get_all_codes {
	my $self = shift;

	my $file = "/root/nitish/Onix/ONIX_Books_3.0_sample_1/ONIX_BookProduct_CodeLists_Issue_21.csv";
	my $csv = Text::CSV->new( {binary => 1} )
			or die "Cannot use CSV: " . Text::CSV->error_diag();
	open my $fh, "<:encoding(utf8)", $file 
			or die "$file: $!";

	my %hash;
	while ( my $row = $csv->getline($fh) ) {
		$hash{ $row->[0] }->{$row->[1]} = 1;
	}
	
	return \%hash;
}

=head2
Accept the code value, and the code list number
Check if the value for that code list for that code value is defined
=cut
sub check_code {
	my $self	= shift;
	my $code	= shift;
	my $list	= shift;

	my $href = $self->get_all_codes();

	if ( 
			defined($href) 
		&& 	defined($href->{$list}) 
		&& 	defined($href->{$list}->{$code})
	) {
		return 1;
	} else {
		return 0;
	}
}

1;
