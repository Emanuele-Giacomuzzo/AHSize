plot.ecosystems.points.ES = function(data,
                                     ecosystem_type_input,
                                     response_variable) {
  
  data %>%
    
    # Manipulate
    
    filter(!time_point == 0,
           ecosystem_type %in% ecosystem_type_input) %>%
    
    # Create plot
    
    ggplot(aes(x = day,
               y = get(response_variable),
               color = ecosystem_type,
               group = interaction(day, ecosystem_type))) +
    
    # Points
    
    geom_point(stat = "summary",
               fun = "mean",
               position = position_dodge(dodging)) +
    geom_errorbar(aes(ymin = get(paste0(response_variable, "_lower")),
                      ymax = get(paste0(response_variable, "_upper"))),
                  width = 0.2,
                  position = position_dodge(dodging)) +
    
    # Lines
    
    geom_line(stat = "summary",
              fun = "mean",
              aes(group = ecosystem_type),
              position = position_dodge(dodging),
              linewidth = treatment_lines_linewidth) + 
    
    # Axes & legend
    
    labs(x = axis_names$axis_name[axis_names$variable == "day"],
         y = axis_names$axis_name[axis_names$variable == response_variable],
         color = "") +
    scale_x_continuous(breaks = unique(data$day)) +
    guides(color = guide_legend(order = 1,
                                title = NULL,
                                nrow = 2)) + 
    scale_color_manual(values = treatment_colours) + 
    
    # Extra graphic elements
    
    theme_bw() +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          legend.position = legend_position,
          legend.key.width = unit(legend_width_cm, "cm")) +
    geom_vline(xintercept = resource_flow_days,
               linetype = resource_flow_line_type,
               color = resource_flow_line_colour,
               linewidth = resource_flow_line_width) +
    geom_hline(yintercept = 0,
               linetype = zero_line_ES_line_type,
               color = zero_line_ES_colour,
               linewidth = zero_line_ES_line_width)
}
