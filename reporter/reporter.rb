#!/bin/ruby

require "prawn"

def report(pdf)

  Prawn::Fonts::AFM.hide_m17n_warning = true

  Prawn::Document.generate("report.pdf") do

    text "Findings", size: 30, style: :bold, align: :center

    move_down 20

    pdf.each_line do |line|
      if line.start_with?("USER TASK:")

      	formatted_text [
          { text: ">>> TASK: ", color: "000000", styles: [:bold] },
		{ text: line.split(":", 2).last.strip.upcase, color: "000000", styles: [:bold] }        ]

         move_down 5
       end

      if line.start_with?("STAGE:")

        formatted_text [
          { text: "STAGE: ", color: "00FFFF", styles: [:bold] },
          { text: line.split(":", 2).last.strip }
        ]

        move_down 10

      elsif line.start_with?("FINDING:")

        formatted_text [
          { text: "FINDING: ", color: "FFFF00", styles: [:bold] },
          { text: line.split(":", 2).last.strip }
        ]

        move_down 10

      elsif line.start_with?("SIGNIFICANCE:")

        formatted_text [
          { text: "SIGNIFICANCE: ", color: "FF0000", styles: [:bold] },
          { text: line.split(":", 2).last.strip }
        ]

        move_down 10

      elsif line.start_with?("MAYBE:")

        formatted_text [
          { text: "MAYBE: ", color: "FF00FF", styles: [:bold] },
          { text: line.split(":", 2).last.strip }
        ]

        move_down 10

      elsif line.start_with?("NEXT COMMAND:")

        formatted_text [
          { text: "NEXT COMMAND: ", color: "0000FF", styles: [:bold] },
          { text: line.split(":", 2).last.strip }
        ]

        move_down 30

        stroke_horizontal_rule

        move_down 30

      end

    end

  end

end