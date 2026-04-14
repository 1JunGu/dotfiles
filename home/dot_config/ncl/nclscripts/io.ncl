; ******************************************************
; This function creates a new NetCDF file for output after deleting
; the file if it already exists. It returns the file handle.
; ******************************************************
undef("addfile_create")
function addfile_create( fileOutName:string )
local fileOutname, fileOut
begin
    system("rm -f " + fileOutName)
    fileOut = addfile(fileOutName, "c")
    return fileOut
end
; ******************************************************
; This procedure collect all files in filesList and
; output avg values of all vars to a single file.
; ******************************************************
undef("collect_files_vars")
procedure collect_files_vars(filesList:string, varsList:string, fileOutName:string, opt:string)
local filesIn, varsList, varList, fileOut, varName, iVar
begin
    if ( .not. (opt .eq. "join" .or. opt .eq. "avg") ) then
        print("ERROR in collect_files_vars: option must be join or avg")
        exit
    end if
    filesIn = addfiles(filesList, "r")
    ListSetType(filesIn, "join")
    if ( dimsizes(varsList).eq.1 .and. varsList .eq. "all" ) then
        varList = getfilevarnames(filesIn[0])
    else
        varList = varsList
    end if

    fileOut = addfile_create(fileOutName)
    do iVar = 0, dimsizes(varList) - 1
        varName = varList(iVar)
        print("Collecting [" + varName + "]...")
        if ( opt .eq. "join" ) then
            fileOut->$varName$ = filesIn[:]->$varName$
        else
            fileOut->$varName$ = dim_avg_n_Wrap(filesIn[:]->$varName$, 0)
        end if
    end do
    delete([/filesIn, fileOut, varList, varName, iVar/])
end
; ******************************************************
; This function return a time array in the format YYYY-MM-DD_HH.00.00 (MPAS output time format)
; !TODO
; ******************************************************
;undef ("yyyymmddhh_mpastime")
;function yyyymmddhh_mpastime (yrStrt[1]:integer, moStrt[1]:integer, dayStrt[1]:integer, yrLast[1]:integer, moLast[1]:integer, dayLast[1]:integer, hrStep[1]:integer, TYPE:string)
;local n, ndays, nmos, nyrs, ntim, year, nmo, ndy, tdum, nhr, nhrs
;begin
;  nmos = 12
;  ndays= 31
;  nyrs = yrLast-yrStrt+1
;  if (nyrs = 1) then
;    nmos = moLast - moStrt + 1
;    if (nmos = 1) then
;        ndays = dayLast - dayStrt + 1
;    end if
;  end if
;  nhrd = 24/hrStep               ; # of hours per day
;  ntim = nyrs*nmos*ndays*nhrd      ; make long enough array
;  tdum = new ( ntim, TYPE, "No_FillValue" )
;
;  year = 0
;  if (isatt(yrStrt,"calendar")) then
;      year@calendar = yrStrt@calendar   ; needed for days in month
;  end if
;
;  n = -1 ; initialize counter index
;  do year=yrStrt,yrLast
;    do nmo=1,nmos
;       YRM  = year*1000000 + nmo*10000
;       nday = days_in_month(year, nmo)
;      do ndy=1,nday
;        do nhr=0,23,hrStep
;           n = n+1
;           tdum(n) = YRM + ndy*100 + nhr
;        end do
;      end do
;    end do
;  end do
;
;  time      = tdum(0:n) ; cut out only filled in times
;  time@long_name = "time"
;  time@units     = "YYYYMMDDHH"
;
;  if (isatt(yrStrt,"calendar")) then
;      time@calendar  = yrStrt@calendar
;  end if
;
;  time!0    = "time"
;  time&time =  time
;  return (time)
;end
;************************************************************************* 