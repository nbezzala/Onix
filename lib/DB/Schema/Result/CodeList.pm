use utf8;
package DB::Schema::Result::CodeList;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::CodeList

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<CodeList>

=cut

__PACKAGE__->table("CodeList");

=head1 ACCESSORS

=head2 number

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 value

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 notes

  data_type: 'text'
  is_nullable: 1

=head2 issuenumber

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "number",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "value",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "notes",
  { data_type => "text", is_nullable => 1 },
  "issuenumber",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</number>

=item * L</value>

=back

=cut

__PACKAGE__->set_primary_key("number", "value");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-07-25 00:42:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sJ8UPz8Lkh0nbNn8uoV1Tw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
