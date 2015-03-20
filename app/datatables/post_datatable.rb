class PostDatatable < AjaxDatatablesRails::Base
  
  def_delegator :@view, :link_to
  def_delegator :@view, :h
  def_delegator :@view, :mail_to

  # or define them in one pass
  def_delegators :@view, :link_to, :h, :mailto, :edit_resource_path, :other_method

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Post.label']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= []
  end

  private

  def data
    records.map do |record|
      [ 
        record.label,
        record.author.name,
        record.created_at,
        [link_to(record.tags[0].label, "/tag?=#{record.tags[0].id}"),
        link_to(record.tags[1].label, "/tag?=#{record.tags[1].id}"),
        link_to(record.tags[2].label, "/tag?=#{record.tags[2].id}")]
      ]      
    end
  end

  def get_raw_records
    Post.all.includes(:author, :tags, :posts_tags)
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
