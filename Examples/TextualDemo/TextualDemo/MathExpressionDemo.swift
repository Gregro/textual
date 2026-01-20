import SwiftUI
import Textual

struct MathExpressionDemo: View {
  var body: some View {
    Form {
      Section("Default Patterns ($...$ and $$...$$)") {
        StructuredText(
          markdown: """
            # Math Expressions in the Wild

            Note that regular text should not get flagged as math.  For example, a $59.99 video game might be $64.79 with tax.
            
            Sometimes a UI needs a tiny equation $E = mc^2$ tucked into a sentence. Sometimes it
            needs the full dramatic flourish :doge:.

            $$\\frac{d}{dt}( \\sum_{i=1}^{n} i^2 ) = n^2 + (n-1)^2 + \\cdots + 1^2$$

            ## Inline Snippets

            - Velocity check: $v = \\frac{d}{t}$
            - Budget math: $cost = users \\times 0.12$
            - The classic: $a^2 + b^2 = c^2$

            ## Block Equations

            $$\\int_{0}^{1} x^2\\,dx = \\frac{1}{3}$$

            $$\\nabla \\cdot \\vec{E} = \\frac{\\rho}{\\varepsilon_0}$$

            ###### The Cauchy-Schwarz Inequality

            ```math
            \\left( \\sum_{k=1}^n a_k b_k \\right)^2 \\leq \\left( \\sum_{k=1}^n a_k^2 \\right) \\left( \\sum_{k=1}^n b_k^2 \\right)
            ```

            ## Tiny Debugging Note

            We used the loss curve to spot a regression:

            $$L(\\theta) = \\frac{1}{m}\\sum_{i=1}^{m} \\left( \\hat{y}_i - y_i \\right)^2$$

            It wasn't the model. It was a missing normalization step (again) :sad_dog:.
            """,
          patternOptions: .init(
            emoji: .mastoEmoji,
            mathExpressions: true
          )
        )
        .textual.textSelection(.enabled)
      }

      Section("Custom LaTeX Patterns (\\(...\\) and \\[...\\])") {
        StructuredText(
          markdown: """
            # Currency-Safe Math

            With custom LaTeX delimiters, currency works fine: a $59.99 game is $64.79 with tax.

            But math still renders! The quadratic formula is \\\\(x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}\\\\).

            And block equations work too:

            \\\\[\\int_0^\\infty e^{-x^2} dx = \\frac{\\sqrt{\\pi}}{2}\\\\]

            Note: The ` ```math ` code block syntax still works regardless of pattern settings:

            ```math
            E = mc^2
            ```
            """,
          patternOptions: .init(
            mathExpressions: true,
            mathInlinePattern: #"\\\((.+?)\\\)"#,
            mathBlockPattern: #"(?s)\\\[(.+?)\\\]"#
          )
        )
        .textual.textSelection(.enabled)
      }
    }
    .formStyle(.grouped)
  }
}

#Preview {
  MathExpressionDemo()
}
