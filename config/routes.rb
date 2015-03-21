Rails.application.routes.draw do
  #pages
  get 'authors' => 'listauthors#authorsPage'
  get 'info' => 'listauthors#authorsInfoPage'
  get 'post' => 'listauthors#postPage'
  get 'allposts' => 'listauthors#allPostsPage'
  get 'tag' => 'listauthors#tagPage'
  #actives
  get 'authors/list' => 'listauthors#showAuthors'
  get 'posts/list' => 'listauthors#showAllPosts'
  get 'articlesauthors' => 'listauthors#infoAuthor'
  get 'getPost' => 'listauthors#showPost'
  get 'getComments' => 'listauthors#showPostComments'
  get 'getPostsByTag' => 'listauthors#showPostByTags'
  #orders
  get 'orders' => 'orderlist#orderPage'
  get 'getOrders' => 'orderlist#orders'
end
