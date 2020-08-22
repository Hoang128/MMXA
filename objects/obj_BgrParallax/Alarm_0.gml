bgrLayer = layer_create(depth + 1);
imgNumber=image_number;
bgrTree = layer_background_create(bgrLayer, sprite_index);
layer_background_visible(bgrTree,1);
if x_Tiled==1 layer_background_htiled(bgrTree, 1);
else          layer_background_htiled(bgrTree, 0);
if y_Tiled==1 layer_background_vtiled(bgrTree, 1);
else          layer_background_vtiled(bgrTree, 0);
sprite_index=noone;