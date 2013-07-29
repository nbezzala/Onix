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

finalize_class();

