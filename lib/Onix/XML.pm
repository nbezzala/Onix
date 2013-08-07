package Onix::XML;

use XML::Rabbit::Root;

has_xpath_object_list	products => './Product'
						=> 'Onix::XML::Product';

finalize_class();

