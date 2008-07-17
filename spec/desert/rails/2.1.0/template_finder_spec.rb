require File.expand_path("#{File.dirname(__FILE__)}/../../../spec_helper")

if ActionView.const_defined?(:TemplateFinder)
  module ActionView
    describe TemplateFinder do
      it_should_behave_like "Desert::Manager fixture"

      before do
        @plugin_path = "#{RAILS_ROOT}/vendor/plugins/aa_depends_on_acts_as_spiffy"
        @plugin_view_path = "#{@plugin_path}/app/views"
      end

      describe "#initialize" do
        before do
          ActionView::TemplateFinder.processed_view_paths.keys.should_not include(@plugin_view_path)
        end

        it "adds plugin view path into the processed view paths" do
          TemplateFinder.new(@plugin_view_path)
          ActionView::TemplateFinder.processed_view_paths.keys.should include(@plugin_view_path)
        end
      end
    end
  end
end
