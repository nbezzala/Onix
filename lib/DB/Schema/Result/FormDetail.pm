use utf8;
package DB::Schema::Result::FormDetail;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::FormDetail

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<FormDetail>

=cut

__PACKAGE__->table("FormDetail");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 descriptivedetailid

  data_type: 'integer'
  is_nullable: 1

=head2 formdetail

  data_type: 'char'
  is_nullable: 1
  size: 4

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "descriptivedetailid",
  { data_type => "integer", is_nullable => 1 },
  "formdetail",
  { data_type => "char", is_nullable => 1, size => 4 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-07-29 01:44:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0rXMwkNDKxjt9LKv1iphxg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->belongs_to( desc_detail => 'DB::Schema::Result::DescriptiveDetail', 'descriptivedetailid' );

1;
