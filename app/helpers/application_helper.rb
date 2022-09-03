module ApplicationHelper
  def input_class(error: false)
    base = "block w-full appearance-none rounded-md border sm:text-sm"
    if error
      "#{base} border-red-300 pr-10 text-red-900 placeholder-red-300 focus:border-red-500 focus:outline-none focus:ring-red-500"
    else
      "#{base} border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-green-500 focus:outline-none focus:ring-green-500"
    end
  end
end
