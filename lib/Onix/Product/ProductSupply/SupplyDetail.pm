package Onix::Product::ProductSupply::SupplyDetail;
use XML::Rabbit;

has_xpath_value	availability => './ProductAvailability';
has_xpath_object supplier => './Supplier'
				=> 'Onix::Product::ProductSupply::SupplyDetail::Supplier';
has_xpath_object_list supply_dates => './SupplyDate'
				=> 'Onix::Product::ProductSupply::SupplyDetail::SupplyDate';
has_xpath_object_list stocks => './Stock'
				=> 'Onix::Product::ProductSupply::SupplyDetail::Stock';
has_xpath_object_list prices => './Price'
				=> 'Onix::Product::ProductSupply::SupplyDetail::Price';

finalize_class();



package Onix::Product::ProductSupply::SupplyDetail::Supplier;
use XML::Rabbit;

has_xpath_value supplier_role => './SupplierRole';
has_xpath_value supplier_name => './SupplierName';

finalize_class();



package Onix::Product::ProductSupply::SupplyDetail::SupplyDate;
use XML::Rabbit;

has_xpath_value role	=> './SupplyDateRole';
has_xpath_value date	=> './Date';

finalize_class();



package Onix::Product::ProductSupply::SupplyDetail::Stock;
use XML::Rabbit;

has_xpath_value 		on_order	=> './OnOrder';
has_xpath_value_list 	on_hand 	=> './OnHand';

finalize_class();



package Onix::Product::ProductSupply::SupplyDetail::Price;
use XML::Rabbit;

has_xpath_value type			=> './PriceType';
has_xpath_value amount			=> './PriceAmount';
has_xpath_value currency_code	=> './CurrencyCode';

finalize_class();


