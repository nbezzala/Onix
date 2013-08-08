package Onix::XML::Product;
use XML::Rabbit;

has_xpath_value 	record_ref => './RecordReference';

has_xpath_object	prod_ident  	=> './ProductIdentifier'
					=> 'Onix::XML::Product::ProductIdentifier';
has_xpath_object	desc_detail		=> './DescriptiveDetail'
					=> 'Onix::XML::Product::DescriptiveDetail';
has_xpath_object_list	supplies	=> './ProductSupply'
					=> 'Onix::XML::Product::ProductSupply';

finalize_class();


package Onix::XML::Product::ProductIdentifier;
use XML::Rabbit;
with 'Onix::ValidateCodes';

has_xpath_value		pid_type => './ProductIDType';
has_xpath_value		id_value => './IDValue';

sub BUILD {
	my $self = shift;

	die "Invalid Code used for ProductIDType: " . $self->pid_type . "\n" 
	unless $self->check_code($self->pid_type, 5);
}

finalize_class();


package Onix::XML::Product::DescriptiveDetail;
use XML::Rabbit;
use Data::Dumper;
with 'Onix::ValidateCodes';

has_xpath_value		prod_composition => './ProductComposition';
has_xpath_value		prod_formcode	=> './ProductForm';
has_xpath_value_list		form_details => './ProductFormDetail';
has_xpath_object_list	features => './ProductFormFeature'
						=> 'Onix::XML::Product::DescriptiveDetail::FormFeature';

sub BUILD {
	my $self = shift;

	die "Invalid Code used for ProductComposition: " . $self->prod_composition . "\n" 
	unless $self->check_code($self->prod_composition, 2);

	die "Invalid Code used for ProductForm: " . $self->prod_formcode . "\n" 
	unless $self->check_code($self->prod_formcode, 150);

	foreach my $detail ( @{$self->form_details} ) {
		die "Invalid Code used for ProductFormDetail: $detail \n" 
		unless $self->check_code($detail, 175);
	}
}

finalize_class();


package Onix::XML::Product::DescriptiveDetail::FormFeature;
use XML::Rabbit;

has_xpath_value	feature_type => './ProductFormFeatureType';	
has_xpath_value	feature_value => './ProductFormFeatureValue';	
has_xpath_value	feature_desc => './ProductFormFeatureDescription';	

finalize_class();


package Onix::XML::Product::ProductSupply;
use XML::Rabbit;

has_xpath_object_list	supply_details => './SupplyDetail'
						=> 'Onix::XML::Product::ProductSupply::SupplyDetail';

finalize_class();


