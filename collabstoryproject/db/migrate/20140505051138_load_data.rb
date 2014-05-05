class LoadData < ActiveRecord::Migration
  def up
  	down

  	us = User.new(:username => "Tester1")
  	us2 = User.new(:username => "Tester2")


  	ts1 = Story.new(:summary => "This is a test story, in which awesome things happen", :title => "TEST STORY 1")
  	ts1.user = us
  	ts1.save(:validate => false)

  	ts2 = Story.new(:summary => "In this second test story, cool things happend", :title => "TEST STORY 2")
  	ts2.user = us2
  	ts2.save(:validate => false)

  	n1 = Node.new(:text => "test node 1 11111111 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut neque nec felis convallis molestie quis id nisi. Morbi dolor enim, ullamcorper egestas risus at, facilisis semper dolor. Mauris fringilla pulvinar erat, a sodales ligula varius dignissim. Aenean sed purus non magna ornare sagittis. Vestibulum porta, lorem at consequat interdum, massa quam cursus odio, eget vestibulum nisi magna ut magna. Maecenas nec tincidunt nibh. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse euismod accumsan leo, id feugiat diam consectetur ut. Donec quis ultrices nulla, in venenatis neque. Nullam non lectus id magna cursus consectetur. Quisque sed ligula ut neque lobortis fringilla. Nam at mi ac velit vehicula consequat. Mauris ullamcorper neque ut aliquet pretium. ")
  	n1.user = us
  	n1.truth = true
  	n1.story = ts1
  	n1.save(:validate => false)
  	n2 = Node.new(:text => "test node 2 22222222 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut neque nec felis convallis molestie quis id nisi. Morbi dolor enim, ullamcorper egestas risus at, facilisis semper dolor. Mauris fringilla pulvinar erat, a sodales ligula varius dignissim. Aenean sed purus non magna ornare sagittis. Vestibulum porta, lorem at consequat interdum, massa quam cursus odio, eget vestibulum nisi magna ut magna. Maecenas nec tincidunt nibh. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse euismod accumsan leo, id feugiat diam consectetur ut. Donec quis ultrices nulla, in venenatis neque. Nullam non lectus id magna cursus consectetur. Quisque sed ligula ut neque lobortis fringilla. Nam at mi ac velit vehicula consequat. Mauris ullamcorper neque ut aliquet pretium. ")
  	n2.story = ts1
  	n2.user = us
  	n2.truth = false
  	n2.save(:validate => false)
  	n3 = Node.new(:text => "test node 3 33333333 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut neque nec felis convallis molestie quis id nisi. Morbi dolor enim, ullamcorper egestas risus at, facilisis semper dolor. Mauris fringilla pulvinar erat, a sodales ligula varius dignissim. Aenean sed purus non magna ornare sagittis. Vestibulum porta, lorem at consequat interdum, massa quam cursus odio, eget vestibulum nisi magna ut magna. Maecenas nec tincidunt nibh. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse euismod accumsan leo, id feugiat diam consectetur ut. Donec quis ultrices nulla, in venenatis neque. Nullam non lectus id magna cursus consectetur. Quisque sed ligula ut neque lobortis fringilla. Nam at mi ac velit vehicula consequat. Mauris ullamcorper neque ut aliquet pretium. ")
  	n3.user = us
  	n3.truth = false
  	n3.story = ts1
  	n3.save(:validate => false)

  	n4 = Node.new(:text => "test node 4  44444444 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut neque nec felis convallis molestie quis id nisi. Morbi dolor enim, ullamcorper egestas risus at, facilisis semper dolor. Mauris fringilla pulvinar erat, a sodales ligula varius dignissim. Aenean sed purus non magna ornare sagittis. Vestibulum porta, lorem at consequat interdum, massa quam cursus odio, eget vestibulum nisi magna ut magna. Maecenas nec tincidunt nibh. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse euismod accumsan leo, id feugiat diam consectetur ut. Donec quis ultrices nulla, in venenatis neque. Nullam non lectus id magna cursus consectetur. Quisque sed ligula ut neque lobortis fringilla. Nam at mi ac velit vehicula consequat. Mauris ullamcorper neque ut aliquet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut neque nec felis convallis molestie quis id nisi. Morbi dolor enim, ullamcorper egestas risus at, facilisis semper dolor. Mauris fringilla pulvinar erat, a sodales ligula varius dignissim. Aenean sed purus non magna ornare sagittis. Vestibulum porta, lorem at consequat interdum, massa quam cursus odio, eget vestibulum nisi magna ut magna. Maecenas nec tincidunt nibh. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse euismod accumsan leo, id feugiat diam consectetur ut. Donec quis ultrices nulla, in venenatis neque. Nullam non lectus id magna cursus consectetur. Quisque sed ligula ut neque lobortis fringilla. Nam at mi ac velit vehicula consequat. Mauris ullamcorper neque ut aliquet pretium. ")
  	n4.user = us2
  	n4.story = ts2
  	n4.truth = true
  	n4.save(:validate => false)
  	n5 = Node.new(:text => "test node 5 55555555 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut neque nec felis convallis molestie quis id nisi. Morbi dolor enim, ullamcorper egestas risus at, facilisis semper dolor. Mauris fringilla pulvinar erat, a sodales ligula varius dignissim. Aenean sed purus non magna ornare sagittis. Vestibulum porta, lorem at consequat interdum, massa quam cursus odio, eget vestibulum nisi magna ut magna. Maecenas nec tincidunt nibh. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse euismod accumsan leo, id feugiat diam consectetur ut. Donec quis ultrices nulla, in venenatis neque. Nullam non lectus id magna cursus consectetur. Quisque sed ligula ut neque lobortis fringilla. Nam at mi ac velit vehicula consequat. Mauris ullamcorper neque ut aliquet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut neque nec felis convallis molestie quis id nisi. Morbi dolor enim, ullamcorper egestas risus at, facilisis semper dolor. Mauris fringilla pulvinar erat, a sodales ligula varius dignissim. Aenean sed purus non magna ornare sagittis. Vestibulum porta, lorem at consequat interdum, massa quam cursus odio, eget vestibulum nisi magna ut magna. Maecenas nec tincidunt nibh. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse euismod accumsan leo, id feugiat diam consectetur ut. Donec quis ultrices nulla, in venenatis neque. Nullam non lectus id magna cursus consectetur. Quisque sed ligula ut neque lobortis fringilla. Nam at mi ac velit vehicula consequat. Mauris ullamcorper neque ut aliquet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut neque nec felis convallis molestie quis id nisi. Morbi dolor enim, ullamcorper egestas risus at, facilisis semper dolor. Mauris fringilla pulvinar erat, a sodales ligula varius dignissim. Aenean sed purus non magna ornare sagittis. Vestibulum porta, lorem at consequat interdum, massa quam cursus odio, eget vestibulum nisi magna ut magna. Maecenas nec tincidunt nibh. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse euismod accumsan leo, id feugiat diam consectetur ut. Donec quis ultrices nulla, in venenatis neque. Nullam non lectus id magna cursus consectetur. Quisque sed ligula ut neque lobortis fringilla. Nam at mi ac velit vehicula consequat. Mauris ullamcorper neque ut aliquet pretium. ")
  	n5.user = us2
  	n5.story = ts2
  	n5.truth = false
  	n5.save(:validate => false)
  	n6 = Node.new(:text => "test node 6 666666 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut neque nec felis convallis molestie quis id nisi. Morbi dolor enim, ullamcorper egestas risus at, facilisis semper dolor. Mauris fringilla pulvinar erat, a sodales ligula varius dignissim. Aenean sed purus non magna ornare sagittis. Vestibulum porta, lorem at consequat interdum, massa quam cursus odio, eget vestibulum nisi magna ut magna. Maecenas nec tincidunt nibh. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse euismod accumsan leo, id feugiat diam consectetur ut. Donec quis ultrices nulla, in venenatis neque. Nullam non lectus id magna cursus consectetur. Quisque sed ligula ut neque lobortis fringilla. Nam at mi ac velit vehicula consequat. Mauris ullamcorper neque ut aliquet pretium. ")
  	n6.user = us2
  	n6.story = ts2
  	n6.truth = false
  	n6.save(:validate => false)

    l1 = Link.new(:source => 1, :target => 2)
    l1.save(:validate => false)


    l2 = Link.new(:source => 1, :target => 3)
    l2.save(:validate => false)


    l3 = Link.new(:source => 4, :target => 5)
    l3.save(:validate => false)


    l4 = Link.new(:source => 5, :target => 6)
    l4.save(:validate => false)


  end

  def down
  	Story.delete_all
  	Node.delete_all
  end
end
