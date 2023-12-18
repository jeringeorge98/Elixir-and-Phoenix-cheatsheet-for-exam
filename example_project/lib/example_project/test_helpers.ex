defmodule ExampleProject.TestHelpers do
  use Hound.Helpers

  defmacro __using__(_opts \\ []) do
    quote do
      # Taken from https://github.com/HashNuke/hound/issues/127
      # (Extended quite a bit by us)
      def click_on(text) do
        text
        |> find_element_with_text
        |> click
      end

      def find_element_with_text(text) do
        case find_all_elements(:link_text, text) do
          [] -> find_some_element_with_text(text)
          [element] -> element
          _multiple_elements -> raise "Multiple elements found with the text #{text}"
        end
      end

      def find_some_element_with_text(text) do
        find_button_with_text(text) ||
          find_input_with_text(text) ||
          find_label_with_text(text) ||
          raise "No element found with the text '#{text}'"
      end

      defp find_button_with_text(text) do
        find_all_elements(:tag, "button")
        |> Enum.find(&String.contains?(inner_text(&1), text))
      end

      defp find_link_with_text(text) do
        find_all_elements(:tag, "a")
        |> Enum.find(&String.contains?(inner_text(&1), text))
      end

      defp find_label_with_text(text) do
        find_all_elements(:tag, "label")
        |> Enum.find(&(inner_text(&1) == text))
      end

      def find_input_with_text(text) do
        find_all_elements(:css, "input[value='#{text}']")
        |> List.first()
      end

      def find_input_with_id_or_name(id_or_name) do
        find_element(:css, "input[id='#{id_or_name}'],input[name='#{id_or_name}']")
        |> List.first()
      end

      def find_text_matching(elements, text) do
        Enum.find(elements, fn element -> inner_text(element) =~ text end)
      end

      def fill_in(type, field_name, with: text) do
        fill_field({:name, "#{type}[#{field_name}]"}, text)
      end

      def submit do
        submit_element({:css, "input[type=submit],button[type=submit]"})
      end

      def ignore_confirm_dialog do
        execute_script("window.confirm = function(){return true;}")
      end

      def image_named(name) do
        find_all_elements(:tag, "img")
        |> any_have_src_matching?(name)
      end

      def any_have_src_matching?(elements, name) do
        Enum.any?(elements, fn e ->
          attribute_value(e, "src") |> String.contains?(name)
        end)
      end

      def select(option_text, from: select_name) do
        find_element(:css, "select[name*='#{select_name}']")
        |> find_all_within_element(:css, "option")
        |> Enum.find(&(inner_text(&1) == option_text))
        |> click
      end

      def check(checkbox_name_id) do
        find_element(
          :css,
          "input[id=\"#{checkbox_name_id}\"][type=\"checkbox\"],input[name=\"#{checkbox_name_id}\"][type=\"checkbox\"]"
        )
        |> click
      end

      def scroll_click(element) do
        {width, height} = element_location(element)
        execute_script("window.scrollTo(#{width},#{height});")
        click(element)
      end

      def scroll_into_view(element) do
        {width, height} = element_location(element)
        execute_script("window.scrollTo(#{width},#{height});")
      end

      def ensure_substring_order(text, substrs) do
        case substrs do
          [] ->
            true

          [substr | rest] ->
            if String.contains?(text, substr) do
              ensure_substring_order(String.split(text, substr) |> List.last(), rest)
            else
              false
            end
        end
      end
    end
  end
end
