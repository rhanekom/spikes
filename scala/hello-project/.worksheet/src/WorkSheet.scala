object WorkSheet {import scala.runtime.WorksheetSupport._; def main(args: Array[String])=$execute{;$skip(30); 
  val x = 1;System.out.println("""x  : Int = """ + $show(x ));$skip(31); 
  def increase(i: Int) = i + 1;System.out.println("""increase: (i: Int)Int""");$skip(22); 
  val y = increase(x);System.out.println("""y  : Int = """ + $show(y ))}
}