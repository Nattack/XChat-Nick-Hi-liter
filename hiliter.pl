#!/usr/bin/perl

use warnings;

Xchat::register( "Highlight Collect", "0.1", "Collects Highlights", \&unload );
Xchat::hook_print( "Channel Msg Hilight", "highLighter");
Xchat::hook_print( "Channel Action Hilight", "actionHighLighter");
Xchat::print("Higlight Collector Loaded");

sub highLighter {
    my $whom = $_[0][0];
    my $text = $_[0][1];
    my $dest = Xchat::get_info('channel');
    my $serv = Xchat::get_info('server');
    Xchat::command("query -nofocus (Hilite)", "", "$serv");
    Xchat::print("\00302<\002\00308$whom\017\00302>\017\t$text (\00304$dest\017, \00304$serv\017)", "(Hilite)", "$serv");
    return Xchat::EAT_NONE;
}

sub actionHighLighter
{
    my $whom = $_[0][0];
    my $text = $_[0][1];
    my $dest = Xchat::get_info('channel');
    my $serv = Xchat::get_info('server');
    Xchat::command("query -nofocus (Hilite)", "", "$serv");
    Xchat::print("\00313*\017\t\002\00308$whom\017 $text (\00304$dest\017, \00304$serv\017)", "(Hilite)", "$serv");
    return Xchat::EAT_NONE;
}

sub unload {
    Xchat::print("Highlight Collector Unloaded");
}