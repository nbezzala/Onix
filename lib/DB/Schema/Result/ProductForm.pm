use utf8;
package DB::Schema::Result::ProductForm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::ProductForm

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ProductForm>

=cut

__PACKAGE__->table("ProductForm");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 compositioncode

  data_type: 'integer'
  is_nullable: 0

=head2 formcode

  data_type: 'char'
  is_nullable: 0
  size: 2

=head2 featuretype

  data_type: 'integer'
  is_nullable: 1

=head2 featurevalue

  data_type: 'char'
  is_nullable: 1
  size: 2

=head2 featuredesc

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "compositioncode",
  { data_type => "integer", is_nullable => 0 },
  "formcode",
  { data_type => "char", is_nullable => 0, size => 2 },
  "featuretype",
  { data_type => "integer", is_nullable => 1 },
  "featurevalue",
  { data_type => "char", is_nullable => 1, size => 2 },
  "featuredesc",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-07-25 00:42:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3cuJf1qUcGL0OJLunhCBYQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
