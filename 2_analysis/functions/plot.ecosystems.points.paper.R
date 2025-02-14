plot.ecosystems.points.paper = function(data,
                                        response_variable_selected,
                                        legend_row_n_input = 3) {
  
  # Prepare data for plotting
  
  data = data %>%
    filter(!is.na(!!sym(response_variable_selected))) %>%
    summarySE(measurevar = response_variable_selected,
              groupvars = c("day", "trophic_type", "connection"))
  
  # Create plot
  
  data %>%
    ggplot(aes(x = day,
               y = get(response_variable_selected),
               group = interaction(day, trophic_type, connection),
               color = trophic_type,
               linetype = connection)) +
    
    # Points
    
    geom_point(stat = "summary",
               fun = "mean",
               position = position_dodge(dodging),
               size = treatment_points_size) +
    geom_errorbar(aes(ymax = get(response_variable_selected) + ci,
                      ymin = get(response_variable_selected) - ci),
                  width = width_errorbar,
                  position = position_dodge(dodging)) +
    
    # Lines
    
    geom_line(stat = "summary",
              fun = "mean",
              aes(group = interaction(trophic_type, connection)),
              position = position_dodge(dodging),
              linewidth = treatment_lines_linewidth) +
    scale_linetype_manual(values = treatment_linetypes) +
    
    # Axes and legend
    
    labs(x = axis_names$axis_name[axis_names$variable == "day"],
         y = axis_names$axis_name[axis_names$variable == response_variable_selected][[1]],
         color = "") +
    scale_x_continuous(breaks = unique(data$day)) +
    guides(color = guide_legend(order = 1,
                                title = NULL,
                                nrow = legend_row_n_input),
           linetype = guide_legend(order = 2,
                                   title = NULL,
                                   nrow = legend_row_n_input)) +
    scale_color_manual(values = treatment_colours) +
    
    # Extra graphic elements
    
    theme_bw() +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          legend.position = legend_position,
          legend.key.width = unit(legend_width_cm, "cm"),
          axis.text = element_text(size = paper_labels_size), 
          axis.title = element_text(size = paper_labels_size),
          legend.text = element_text(size = paper_labels_size)) +
    geom_rect(xmin = grey_background_xmin, 
              xmax = grey_background_xmax,
              ymin = grey_background_ymin, 
              ymax = grey_background_ymax, 
              fill = grey_background_fill, 
              alpha = grey_background_alpha,
              color = grey_background_color) +
    geom_hline(yintercept = 0,
               color = zero_line_colour,
               linetype = zero_line_line_type,
               linewidth = zero_line_line_width) +
    geom_vline(xintercept = resource_flow_days,
               linetype = resource_flow_line_type,
               color = resource_flow_line_colour,
               linewidth = resource_flow_line_width)
  
}
