package Onix::Books;
use XML::Rabbit::Root;

has_xpath_object_list	products => './Product'
						=> 'Onix::Product';

finalize_class();

package Onix::Product;
use XML::Rabbit;

has_xpath_value 	record_ref => './RecordReference';

has_xpath_object	prod_ident  	=> './ProductIdentifier'
					=> 'Onix::Product::ProductIdentifier';
has_xpath_object	desc_detail		=> './DescriptiveDetail'
					=> 'Onix::Product::DescriptiveDetail';
has_xpath_object_list	supplies	=> './ProductSupply'
					=> 'Onix::Product::ProductSupply';

finalize_class();


package Onix::Product::ProductIdentifier;
use XML::Rabbit;

has_xpath_value		pid_type => './ProductIDType';
has_xpath_value		id_value => './IDValue';

finalize_class();


package Onix::Product::DescriptiveDetail;
use XML::Rabbit;

has_xpath_value		prod_composition => './ProductComposition';
has_xpath_value		prod_formcode	=> './ProductForm';
has_xpath_value_list		form_details => './ProductFormDetail';
has_xpath_object_list	features => './ProductFormFeature'
						=> 'Onix::Product::DescriptiveDetail::FormFeature';

finalize_class();


package Onix::Product::DescriptiveDetail::FormFeature;
use XML::Rabbit;

has_xpath_value	feature_type => './ProductFormFeatureType';	
has_xpath_value	feature_value => './ProductFormFeatureValue';	
has_xpath_value	feature_desc => './ProductFormFeatureDescription';	

finalize_class();


package Onix::Product::ProductSupply;
use XML::Rabbit;

has_xpath_object_list	supply_details => './SupplyDetail'
						=> 'Onix::Product::ProductSupply::SupplyDetail';

finalize_class();


package Onix::Product::ProductSupply::SupplyDetail;
use XML::Rabbit;

has_xpath_value	availability => './ProductAvailability';
has_xpath_object supplier => './Supplier'
				=> 'Onix::Product::ProductSupply::SupplyDetail::Supplier';

finalize_class();



package Onix::Product::ProductSupply::SupplyDetail::Supplier;
use XML::Rabbit;

has_xpath_value supplier_role => './SupplierRole';
has_xpath_value supplier_name => './SupplierName';

finalize_class();
