begin
    colormap = "bluered_lowS"
    wks = gsn_open_wks("pdf", colormap)
    gsn_define_colormap(wks, colormap)
    gsn_draw_colormap(wks)
end
