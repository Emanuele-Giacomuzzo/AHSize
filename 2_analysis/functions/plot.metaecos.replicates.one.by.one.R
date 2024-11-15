plot.metaecos.replicates.one.by.one = function(data,
                                              response_variable,
                                              legend_row_n_input = 2) {
  
  for(metaecosystem_type_n in c(1,3,5)){
    
    
    metaecosystem_type_i_filtered = metaecosystem_type_i[metaecosystem_type_n:(metaecosystem_type_n+1)]
    
    print(data %>% filter(metaecosystem_type %in% metaecosystem_type_i_filtered) %>% pull(type) %>% unique() %>% as.vector())
    
    p = data %>%
      
      # Manipulate
      
      filter(metaecosystem_type %in% metaecosystem_type_i_filtered) %>%
      
      # Create plot
      
      ggplot(aes(x = day,
                 y = get(response_variable),
                 group = system_nr,
                 fill = system_nr,
                 linetype = connection)) +
      
      # Lines
      
      geom_line(stat = "summary", fun = "mean") +
      scale_linetype_manual(values = treatment_linetypes) +
      
      # Axes & legend
      
      labs(x = axis_names$axis_name[axis_names$variable == "day"],
           y = axis_names$axis_name[axis_names$variable == response_variable],
           linetype = "") +
      scale_x_continuous(breaks = unique(data$day)) +
      guides(linetype = guide_legend(order = 2,
                                     title = NULL,
                                     nrow = legend_row_n_input)) +
      
      # Extra graphic elements
      
      theme_bw() +
      theme(panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            legend.position = legend_position) +
      geom_vline(xintercept = resource_flow_days,
                 linetype = resource_flow_line_type,
                 color = resource_flow_line_colour,
                 linewidth = resource_flow_line_width) +
      geom_rect(xmin = grey_background_xmin, 
                xmax = grey_background_xmax,
                ymin = grey_background_ymin, 
                ymax = grey_background_ymax, 
                fill = grey_background_fill, 
                alpha = grey_background_alpha,
                color = grey_background_color)
    
    print(p)
    
  }
  
}
