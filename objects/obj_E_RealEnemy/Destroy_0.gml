/// @description Create explosion
event_inherited();

var obj = instance_create_depth((bbox_left + bbox_right) / 2, (bbox_top + bbox_bottom) / 2, depth - 1, obj_ExplosionChain);
obj.chainMax = destroy_EChain;
obj.rangeMax = min((bbox_right - bbox_left) / 2, (bbox_bottom - bbox_top) / 2);
obj.dropItem = true;

if (explosionPiece > 0)
{
	var objPiece = instance_create_depth((bbox_left + bbox_right) / 2, (bbox_top + bbox_bottom) / 2, depth - 1, obj_E_PieceChain);
	objPiece.pieceType = pieceSprite;
	objPiece.pieceNumber = explosionPiece;
}