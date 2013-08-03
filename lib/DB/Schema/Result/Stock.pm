use utf8;
package DB::Schema::Result::Stock;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Stock

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Stock>

=cut

__PACKAGE__->table("Stock");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 supplydetailid

  data_type: 'integer'
  is_nullable: 0

=head2 onorder

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "supplydetailid",
  { data_type => "integer", is_nullable => 0 },
  "onorder",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-08-03 07:36:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:09slkkXXytS4+2YNNO9s1g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
