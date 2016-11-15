#!/usr/bin/env perl6

my %count;

sub MAIN (Str $file, Str $pos) {
    for $file.IO.lines -> $line {
        my @tax_ids = split('=', $line)[$pos].perl;
        for @tax_ids -> $id {
            %count{$id} += 1;
        }
    }

    for %count.keys -> $key {
        put $key.subst(/\"/, "", :g).subst(/^\s*/, ""), "\t",  %count{$key};
    } 
}
