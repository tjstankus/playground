require 'asciidoctor'
require 'asciidoctor/extensions'

class GistBlockMacro < Asciidoctor::Extensions::BlockMacroProcessor
  use_dsl

  named :gist

  def process(parent, target, attrs)
    puts "parent -- #{parent.inspect}"
    puts "target -- #{target.inspect}"
    puts "attrs -- #{attrs.inspect}"

    title_html = attrs.has_key?('title') ?
      %(<div class="title">#{attrs['title']}</div>\n) : nil

    html = %(<div class="openblock gist">
      #{title_html}<div class="content">
      <script src="https://gist.github.com/#{target}.js"></script>
      </div>
      </div>)

    create_pass_block parent, html, attrs, subs: nil
  end
end

Asciidoctor::Extensions.register do
  block_macro GistBlockMacro
end

Asciidoctor.render_file('sample_gist.adoc', :safe => :safe, :in_place => true)

