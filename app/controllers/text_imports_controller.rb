class TextImportsController < ApplicationController


  # POST /text_imports
  # POST /text_imports.json
  def create
    # Openning File
    doc = Nokogiri::XML(params[:file])

    # Applying XPath
    doc_xpath = doc.xpath("//messages//message//text")

    ## Empty Vector
    auths = []

    while doc_xpath.length() > 0

      words = doc_xpath.pop().inner_text().split


      words.each do |word|
        word = word.capitalize
        auths << word
      end

    end

    # Remove Duplicates
    auths.uniq

    @text_import = TextImport.new

    @text_import.text= auths.to_s

    respond_to do |format|
      if @text_import.save
        format.html { render @text_import, :remote => true}
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_import
      @text_import = TextImport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_import_params
      params.require(:text_import).permit(:text)
    end
end
