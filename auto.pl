print "*************************************************************************************************************************************\n";
print "*************************************************************************************************************************************\n";
print "INSTRUCCIONES:\n";
print "Este programa de perl automatiza la ejecucion del programa Trimmomatic.\n";
print "\n";
print "Requerimientos:\n";
print "1. Un documento de texto que contenga la lista de archivos '.fastq.gz' y el nombre de la salida en el que se almacenan los resultados\n";
print "   Nota: La lista debe contener los nombres de los archivos separados por un espacio y siguiendo el orden: R1, R2 y output (salida).\n";
print "2. Una vez que se ejecute el programa con la instruccion 'perl auto.pl', pedira el nombre del archivo lista\n";
print "\n";
print "Programa desarrollado por Ricardo Hernandez Morales\n";
print "*************************************************************************************************************************************\n";
print "*************************************************************************************************************************************\n";
print "\n";
print  "Escriba S o si para ejecutar el programa, N o no para detener su ejecucion\n";
$respuesta = <STDIN>;
chomp ($respuesta);
$respuesta = lc($respuesta);
if ($respuesta eq "s" or $respuesta eq "si") {
	print "Escribe el nombre del documento que contiene la lista de archivos '.fastq.gz' y el nombre de la salida: \n";
	$documento = <STDIN>;
	chomp ($documento);
	print "\n";
	open (DOC,"$documento") || die "No se encuentra el archivo $documento\n";
	while ($linea = <DOC>) {
		chomp ($linea);
		($r1,$r2,$salida) = split (' ',$linea);
		$salida1 = "$salida"."_sp_forward_paired.fq.gz";
		$salida2 = "$salida"."_sp_forward_unpaired.fq.gz";
		$salida3 = "$salida"."_sp_reverse_paired.fq.gz";
		$salida4 = "$salida"."_sp_reverse_unpaired.fq.gz";
		$log = "$salida"."_log.txt";
		print "\nEjecutando el programa trimmomatic con los siguientes archivos:\n";
		print "Entrada R1 $r1\n";
		print "Entrada R2 $r2\n";
		print "Salida1 es $salida1\n";
		print "Salida2 es $salida2\n";
		print "Salida3 es $salida3\n";
		print "Salida4 es $salida4\n";
		#Ejecucion del programa:
		system ("trimmomatic PE $r1 $r2 $salida1 $salida2 $salida3 $salida4 ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:100 -trimlog $log");
		#	
	}
	close (DOC);
}
elsif ($respuesta eq "n" or $respuesta eq "no") {
	print "\n";
	print "+++ FIN DEL PROGRAMA +++\n";
	print "\n";
	exit;
}
else {
	print "\n";
	print "--- Las respuestas deberian ser S, si, N, no ---\n";
	print "\n";
	print "--- FIN DEL PROGRAMA ---\n";
	print "\n";
	exit;
}
print "\nEL PROGRAMA HA TERMINADO DE EJECUTAR EL PROGRAMA TRIMMOMATIC\n";
