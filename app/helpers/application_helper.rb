module ApplicationHelper
  def main_nav
  	presenter = Refinery::Pages::MenuPresenter.new(refinery_menu_pages, self)
  	presenter.menu_tag = "div class=\"collapse navbar-collapse navbar-inverse\" id=\"main-nav-collapse\""
    presenter.list_tag = "ul class=\"nav navbar-nav\""
  	presenter.max_depth = 0
  	presenter
  end

  def main_nav_nobg
    presenter = Refinery::Pages::MenuPresenter.new(refinery_menu_pages, self)
    presenter.menu_tag = "div class=\"collapse navbar-collapse\" id=\"main-nav-collapse\""
    presenter.list_tag = "ul class=\"nav navbar-nav pull-right pull-left-xs\""
    presenter.max_depth = 0
    presenter
  end

  def main_navbar_default
    presenter = Refinery::Pages::MenuPresenter.new(refinery_menu_pages, self)
    presenter.menu_tag = "div class=\"collapse navbar-collapse\" id=\"main-nav-collapse\""
    presenter.list_tag = "ul class=\"nav navbar-nav\""
    presenter.max_depth = 0
    presenter
  end

  # def sub_menu_pages(page)
  #   Refinery::Menu.new(refinery_menu_pages.detect{ |item| item.original_id == page.id }.children)
  # end

  # def sub_menu_pages(page)
  #   presenter = Refinery::Menu.new(refinery_menu_pages.detect{ |item| item.original_id == page.id}.children)
  #   #presenter = Refinery::Pages::MenuPresenter.new(refinery_menu_pages.detect{ |item| item.original_id == page.id}.children)
  #   presenter.menu_tag = "div class=\"collapse navbar-collapse\" id=\"main-nav-collapse\""
  #   presenter.list_tag = "ul class=\"nav nav-pills\""
  #   presenter.max_depth = 1
  #   presenter
  # end

  def sub_menu_pages
    sub_menu_items = Refinery::Menu.new(refinery_menu_pages.detect{ |item| item.original_id == @page.id }.children)
    #sub_menu_items = Refinery::Menu.new(refinery_menu_pages.select{ |item| item.parent_id == @page.root.id })
    # style = page_style(@page)
    presenter = Refinery::Pages::MenuPresenter.new(sub_menu_items, self)
    presenter.menu_tag = :div
    # presenter.css = "#{style}"
    presenter.list_tag = "ul class=\"nav nav-pills nav-stacked \""
    # presenter.list_tag_css = "nav nav-pills nav-stacked"
    presenter.max_depth = 1
    first_css = :first
    last_css = :last
    presenter
  end

    def child_sub_menu_pages
    #This works on parent and sub pages -- use 'select' instead of 'detect'
    sub_menu_items = Refinery::Menu.new(refinery_menu_pages.select{ |item| item.parent_id == @page.root.id })
    # style = page_style(@page)
    presenter = Refinery::Pages::MenuPresenter.new(sub_menu_items, self)
    presenter.menu_tag = :div
    # presenter.css = "#{style}"
    presenter.list_tag = "ul class=\"nav nav-pills nav-stacked \""
    # presenter.list_tag_css = "nav nav-pills nav-stacked"
    presenter.max_depth = 1
    first_css = :first
    last_css = :last
    presenter
  end

end
