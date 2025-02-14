plot.ecosystems.replicates.one.by.one = function(data,
                                                 trophy_selected,
                                                 response_variable_selected,
                                                 legend_row_n_input = 2) {
  
  ecosystem_size_and_trophies = unique(data$ecosystem_size_and_trophy)
  
  for (i in 1:length(ecosystem_size_and_trophies)) {
    
    p = data %>%
      
      # Manipulate
      
      filter(ecosystem_size_and_trophy == ecosystem_size_and_trophies[i]) %>%
      
      # Create plot
      
      ggplot(aes(x = day,
                 y = get(response_variable_selected),
                 group = ecosystem_ID,
                 linetype = connection)) +
      
      # Lines
      
      geom_line(stat = "summary", fun = "mean") +
      scale_linetype_manual(values = c("dashed",
                                       "solid")) +
      
      # Axes & legend
      
      labs(x = axis_names$axis_name[axis_names$variable == "day"],
           y = axis_names$axis_name[axis_names$variable == response_variable_selected][[1]],
           linetype = "") +
      scale_x_continuous(breaks = unique(data$day)) +
      guides(linetype = guide_legend(order = 2,
                                     title = NULL,
                                     nrow = legend_row_n_input)) +
      scale_color_manual(values = c("black",
                                    "black")) +
      
      # Extra graphic elements
      
      theme_bw() +
      theme(panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            legend.position = legend_position) +
      geom_rect(xmin = grey_background_xmin,
                xmax = grey_background_xmax,
                ymin = grey_background_ymin,
                ymax = grey_background_ymax,
                fill = grey_background_fill,
                alpha = grey_background_alpha,
                color = grey_background_color) +
      geom_vline(xintercept = resource_flow_days,
                 linetype = resource_flow_line_type,
                 color = resource_flow_line_colour,
                 linewidth = resource_flow_line_width)
    
    print(ecosystem_size_and_trophies[i])
    print(p)
    
  }
  
}
