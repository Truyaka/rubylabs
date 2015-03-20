class AuthorDatatable < AjaxDatatablesRails::Base

  def_delegator :@view, :link_to
  def_delegator :@view, :h
  def_delegator :@view, :mail_to

  # or define them in one pass
  def_delegators :@view, :link_to, :h, :mailto, :edit_resource_path, :other_method

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Author.name']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= []
  end

  private

  def data
    records.map do |record|
      [ 
        record.id,
        record.name,
        record.email,
        record.city,
        record.adress,
        record.birth
      ]   
    end
  end

  def get_raw_records
    Author.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
