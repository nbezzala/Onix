package Onix::Product;

use XML::Rabbit::Root;

has_xpath_value 	record_ref => './Product/RecordReference';
has_xpath_value		desc_detail => './Product/DescriptiveDetail/ProductForm';


has_xpath_object	prod_ident  	=> './Product/ProductIdentifier'
					=> 'Onix::Product::ProductIdentifier';

finalize_class();


package Onix::Product::ProductIdentifier;
use XML::Rabbit;

has_xpath_value		pid_type => './ProductIDType';
has_xpath_value		id_value => './IDValue';

finalize_class();
