Note
----

The items here are [encrypted data bags][] -- they are not useful as stored but
are kept in the repository primarily for self-documentation purposes, to have a
record of what *should* be on the Chef server. You should edit these via API:

    $ knife data bag edit BAG ITEM --secret-file ~/.chef/barcampbangkok/encrypted_data_bag_secret

Let [me][] know if you need the encryption key file in order to make changes! If
you add new items or keys within them, you can add/update the encrypted copy in
the repository for recordkeeping:

    $ knife data bag show BAG ITEM -Fj > data_bags/BAG/ITEM.json

By omitting the `--secret-file` option you'll be given the encrypted gibberish
that is safe to store in the public git repository :-)

[encrypted data bags]: http://wiki.opscode.com/display/chef/Encrypted+Data+Bags
[me]: http://chesmart.in/

