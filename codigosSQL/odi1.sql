<%{
   String targetColsMappedFromSource = odiRef.getColList("", "T.[COL_NAME]", ",\n\t", "", "((UPD AND (NOT UK) AND (NOT TRG)) AND REW)");
   String targetColsMappedOnTarget = odiRef.getColList(odiRef.getColList(",", " ", "", "", "((UPD AND (NOT UK) AND (NOT TRG)) AND REW)"), "T.[COL_NAME]", ",\n\t", "", "((UPD AND (NOT UK) AND TRG) AND REW)");
   if (targetColsMappedFromSource.trim().length() == 0 &&
       targetColsMappedOnTarget.trim().length() == 0)
       throw new OdiKMException( "More target column mappings needed: at least one target column, which is not part of the update key, must have a mapping expression assigned." );
}%>merge into	<%=odiRef.getTable("L", "TARG_NAME", "A")%> T
using	<%=odiRef.getTable("L", "INT_NAME", "A")%> S
on	(
	<%=odiRef.getColList("", "\tT.[COL_NAME]=S.[COL_NAME]", "\n\tand\t", "", "UK")%>
	)
when matched
then update set
	<%=odiRef.getColList("", "T.[COL_NAME]	= S.[COL_NAME]", ",\n\t", "", "((UPD AND (NOT UK) AND (NOT TRG)) AND REW)")%>
	<%=odiRef.getColList(odiRef.getColList(",", " ", "", "", "((UPD AND (NOT UK) AND (NOT TRG)) AND REW)"), "T.[COL_NAME]	= [EXPRESSION]", ",\n\t", "", "((UPD AND (NOT UK) AND TRG) AND REW)")%>
when not matched
then insert
	(
	<%=odiRef.getColList("", "T.[COL_NAME]", ",\n\t", "", "((INS AND (NOT TRG)) AND REW)")%>
	<%=odiRef.getColList(odiRef.getColList(",", " ", "", "", "((INS AND (NOT TRG)) AND REW)"), "T.[COL_NAME]", ",\n\t", "", "((INS AND TRG) AND REW)")%>
	)
values
	(
	<%=odiRef.getColList("", "S.[COL_NAME]", ",\n\t", "", "((INS AND (NOT TRG)) AND REW)")%>
	<%=odiRef.getColList(odiRef.getColList(",", " ", "", "", "((INS AND (NOT TRG)) AND REW)"), "[EXPRESSION]", ",\n\t", "", "((INS AND TRG) AND REW)")%>
	)

    <% if (odiRef.getTargetColList("", "A", "", "", "(SCD_UPD and REW)").length()>0) { %>

update	<%=odiRef.getTable("L", "TARG_NAME", "A")%> T

set	(
<%=odiRef.getColList("", "T.[COL_NAME]", ",\n\t", "", "(((SCD_UPD) and !TRG) and REW)")%>
<%=odiRef.getColList(/* insert comma, only if previous fragment has generated any columns */

                             odiRef.getColList(",", "", "", "", "(((SCD_UPD) and !TRG)and REW)"),

                                 "T.[COL_NAME]", ",\n\t", "", "(((SCD_UPD) and TRG) and REW)")%>

	) = 	(

		select	<%=odiRef.getColList("", "X.[COL_NAME]",",\n\t\t\t","","(((SCD_UPD) and !TRG) and REW)")%>
<%=odiRef.getColList(/* insert comma, only if previous fragment has generated any columns */

    odiRef.getColList(",", "", "", "", "(((SCD_UPD) and !TRG)and REW)"),

                                                 "[EXPRESSION]",",\n\t\t\t","","(((SCD_UPD) and TRG) and REW)")%>

		from	<%=odiRef.getTable("L", "INT_NAME", "A")%> X

		where	<%=odiRef.getColList("", "X.[COL_NAME]\t= T.[COL_NAME]", "\n\t\tand\t", "", "SCD_NK")%>

		and	X.IND_UPDATE	= 'U'

		),

		FECHA_ACTUALIZACION = SYSDATE

where	(<%=odiRef.getColList("", "T.[COL_NAME]", ", ", "", "SCD_NK")%>)

	in	(

		select	<%=odiRef.getColList("", "S.[COL_NAME]", ", ", "", "SCD_NK")%>

		from	<%=odiRef.getTable("L", "INT_NAME", "A")%> S

		where	S.IND_UPDATE	= 'U'

		)
<%=odiRef.getTargetColList("and\t", "T.[COL_NAME]\t= 1", "\nand\t", "", "SCD_FLAG")%>
<%=odiRef.getTargetColList("and\t","[COL_NAME]\t= to_date ('01-01-2400', 'mm-dd-yyyy')","\nand\t","","SCD_END")%>
<%}%>
 
update	WORKER_3.DULCES_SYS T
set	(
T.NOMBRE
	) = 	(
		select	X.NOMBRE
		from	WORKER_3.I$_DULCES_SYS X
		where	X.ID_DULCE	= T.ID_DULCE
		and	X.IND_UPDATE	= 'U'
		),
		FECHA_ACTUALIZACION = SYSDATE
where	(T.ID_DULCE)
	in	(
		select	S.ID_DULCE
		from	WORKER_3.I$_DULCES_SYS S
		where	S.IND_UPDATE	= 'U'
		)
and	FECHA_FIN	= to_date ('01-01-2400', 'mm-dd-yyyy')