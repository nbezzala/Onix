package Onix::XML::Product::ProductSupply::SupplyDetail;
use XML::Rabbit;
with 'Onix::ValidateCodes';

has_xpath_value	availability => './ProductAvailability';
has_xpath_object supplier => './Supplier'
				=> 'Onix::XML::Product::ProductSupply::SupplyDetail::Supplier';
has_xpath_object_list supply_dates => './SupplyDate'
				=> 'Onix::XML::Product::ProductSupply::SupplyDetail::SupplyDate';
has_xpath_object_list stocks => './Stock'
				=> 'Onix::XML::Product::ProductSupply::SupplyDetail::Stock';
has_xpath_object_list prices => './Price'
				=> 'Onix::XML::Product::ProductSupply::SupplyDetail::Price';

sub BUILD {
	my $self = shift;

	die "Invalid Code used for ProductAvailability: " . $self->availability . "\n" 
	unless $self->check_code($self->availability, 65);
}

finalize_class();



package Onix::XML::Product::ProductSupply::SupplyDetail::Supplier;
use XML::Rabbit;
with 'Onix::ValidateCodes';

has_xpath_value supplier_role => './SupplierRole';
has_xpath_value supplier_name => './SupplierName';

sub BUILD {
	my $self = shift;

	die "Invalid Code used for SupplierRole: " . $self->supplier_role . "\n" 
	unless $self->check_code($self->supplier_role, 93);
}

finalize_class();



package Onix::XML::Product::ProductSupply::SupplyDetail::SupplyDate;
use XML::Rabbit;
with 'Onix::ValidateCodes';

has_xpath_value role	=> './SupplyDateRole';
has_xpath_value date	=> './Date';

sub BUILD {
	my $self = shift;

	die "Invalid Code used for SupplyDateRole: " . $self->role . "\n" 
	unless $self->check_code($self->role, 166);
}

finalize_class();



package Onix::XML::Product::ProductSupply::SupplyDetail::Stock;
use XML::Rabbit;

has_xpath_value 		on_order	=> './OnOrder';
has_xpath_value_list 	on_hand 	=> './OnHand';

finalize_class();



package Onix::XML::Product::ProductSupply::SupplyDetail::Price;
use XML::Rabbit;
with 'Onix::ValidateCodes';

has_xpath_value type			=> './PriceType';
has_xpath_value amount			=> './PriceAmount';
has_xpath_value currency_code	=> './CurrencyCode';

sub BUILD {
	my $self = shift;

	die "Invalid Code used for PriceType: " . $self->type . "\n" 
	unless $self->check_code($self->type, 58);

	die "Invalid Code used for CurrencyCode: " . $self->currency_code. "\n" 
	unless $self->check_code($self->currency_code, 96);
}

finalize_class();


