package com.company.assembleegameclient.util
{
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import com.company.util._n5;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.map.Square;
   import flash.utils.ByteArray;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.map.GroundLibrary;
   import com.company.assembleegameclient.map.Map;
   import com.company.util.TextureLibrary;
   import com.company.util.BitmapUtil;
   import com.company.assembleegameclient.map._71;
   import com.company.util.PointUtil;
   
   public class _1H_f
   {
      
      private static const rect0:Rectangle = new Rectangle(0,0,4,4);
      
      private static const p0:Point = new Point(0,0);
      
      private static const rect1:Rectangle = new Rectangle(4,0,4,4);
      
      private static const p1:Point = new Point(4,0);
      
      private static const rect2:Rectangle = new Rectangle(0,4,4,4);
      
      private static const p2:Point = new Point(0,4);
      
      private static const rect3:Rectangle = new Rectangle(4,4,4,4);
      
      private static const p3:Point = new Point(4,4);
      
      private static const _lK_:int = 0;
      
      private static const SIDE0:int = 1;
      
      private static const SIDE1:int = 2;
      
      private static const _tj:int = 3;
      
      private static const INNERP1:int = 4;
      
      private static const INNERP2:int = 5;
      
      private static const _1Q_q:Vector.<Vector.<_n5>> = _06F_();
      
      private static const RECT01:Rectangle = new Rectangle(0,0,8,4);
      
      private static const RECT13:Rectangle = new Rectangle(4,0,4,8);
      
      private static const RECT23:Rectangle = new Rectangle(0,4,8,4);
      
      private static const RECT02:Rectangle = new Rectangle(0,0,4,8);
      
      private static const RECT0:Rectangle = new Rectangle(0,0,4,4);
      
      private static const RECT1:Rectangle = new Rectangle(4,0,4,4);
      
      private static const RECT2:Rectangle = new Rectangle(0,4,4,4);
      
      private static const RECT3:Rectangle = new Rectangle(4,4,4,4);
      
      private static const POINT0:Point = new Point(0,0);
      
      private static const POINT1:Point = new Point(4,0);
      
      private static const POINT2:Point = new Point(0,4);
      
      private static const POINT3:Point = new Point(4,4);
      
      private static var cache_:Vector.<Object> = new <Object>[null,new Object()];
       
      
      public function _1H_f()
      {
         super();
      }
      
      public static function redraw(param1:Square, param2:Boolean) : BitmapData
      {
         var _loc3_:ByteArray = null;
         var _loc5_:BitmapData = null;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         if(Parameters.BlendType == 0)
         {
            return null;
         }
         if(param1.tileType_ == 253)
         {
            _loc3_ = _0N_V_(param1);
         }
         else if(param1.props_.hasEdge)
         {
            _loc3_ = _173(param1);
         }
         else
         {
            _loc3_ = _0P_1(param1);
         }
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:Object = cache_[Parameters.BlendType];
         if(_loc4_.hasOwnProperty(_loc3_))
         {
            return _loc4_[_loc3_];
         }
         if(param1.tileType_ == 253)
         {
            _loc5_ = _0H_M_(_loc3_);
            _loc4_[_loc3_] = _loc5_;
            return _loc5_;
         }
         if(param1.props_.hasEdge)
         {
            _loc5_ = _1dG_(_loc3_);
            _loc4_[_loc3_] = _loc5_;
            return _loc5_;
         }
         if(_loc3_[1] != _loc3_[4])
         {
            _loc6_ = true;
            _loc7_ = true;
         }
         if(_loc3_[3] != _loc3_[4])
         {
            _loc6_ = true;
            _loc8_ = true;
         }
         if(_loc3_[5] != _loc3_[4])
         {
            _loc7_ = true;
            _loc9_ = true;
         }
         if(_loc3_[7] != _loc3_[4])
         {
            _loc8_ = true;
            _loc9_ = true;
         }
         if(!_loc6_ && _loc3_[0] != _loc3_[4])
         {
            _loc6_ = true;
         }
         if(!_loc7_ && _loc3_[2] != _loc3_[4])
         {
            _loc7_ = true;
         }
         if(!_loc8_ && _loc3_[6] != _loc3_[4])
         {
            _loc8_ = true;
         }
         if(!_loc9_ && _loc3_[8] != _loc3_[4])
         {
            _loc9_ = true;
         }
         if(!_loc6_ && !_loc7_ && !_loc8_ && !_loc9_)
         {
            _loc4_[_loc3_] = null;
            return null;
         }
         var _loc10_:BitmapData = GroundLibrary.getBitmapData(param1.tileType_);
         if(param2)
         {
            _loc5_ = _loc10_.clone();
         }
         else
         {
            _loc5_ = new _1wr(_loc10_.width,_loc10_.height,true,0);
         }
         if(_loc6_)
         {
            _qA_(_loc5_,rect0,p0,_1Q_q[0],_loc3_[4],_loc3_[3],_loc3_[0],_loc3_[1]);
         }
         if(_loc7_)
         {
            _qA_(_loc5_,rect1,p1,_1Q_q[1],_loc3_[4],_loc3_[1],_loc3_[2],_loc3_[5]);
         }
         if(_loc8_)
         {
            _qA_(_loc5_,rect2,p2,_1Q_q[2],_loc3_[4],_loc3_[7],_loc3_[6],_loc3_[3]);
         }
         if(_loc9_)
         {
            _qA_(_loc5_,rect3,p3,_1Q_q[3],_loc3_[4],_loc3_[5],_loc3_[8],_loc3_[7]);
         }
         _loc4_[_loc3_] = _loc5_;
         return _loc5_;
      }
      
      private static function _qA_(param1:BitmapData, param2:Rectangle, param3:Point, param4:Vector.<_n5>, param5:uint, param6:uint, param7:uint, param8:uint) : void
      {
         var _loc9_:BitmapData = null;
         var _loc10_:BitmapData = null;
         if(param5 == param6 && param5 == param8)
         {
            _loc10_ = param4[_tj].random();
            _loc9_ = GroundLibrary.getBitmapData(param7);
         }
         else if(param5 != param6 && param5 != param8)
         {
            if(param6 != param8)
            {
               param1.copyPixels(GroundLibrary.getBitmapData(param6),param2,param3,param4[INNERP1].random(),p0,true);
               param1.copyPixels(GroundLibrary.getBitmapData(param8),param2,param3,param4[INNERP2].random(),p0,true);
               return;
            }
            _loc10_ = param4[_lK_].random();
            _loc9_ = GroundLibrary.getBitmapData(param6);
         }
         else if(param5 != param6)
         {
            _loc10_ = param4[SIDE0].random();
            _loc9_ = GroundLibrary.getBitmapData(param6);
         }
         else
         {
            _loc10_ = param4[SIDE1].random();
            _loc9_ = GroundLibrary.getBitmapData(param8);
         }
         param1.copyPixels(_loc9_,param2,param3,_loc10_,p0,true);
      }
      
      private static function _0P_1(param1:Square) : ByteArray
      {
         var _loc2_:int = 0;
         var _loc3_:Square = null;
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:Map = param1.map_;
         var _loc6_:uint = param1.tileType_;
         var _loc7_:int = param1.y_ - 1;
         while(_loc7_ <= param1.y_ + 1)
         {
            _loc2_ = param1.x_ - 1;
            while(_loc2_ <= param1.x_ + 1)
            {
               if(_loc2_ < 0 || _loc2_ >= _loc5_.width_ || _loc7_ < 0 || _loc7_ >= _loc5_.height_ || _loc2_ == param1.x_ && _loc7_ == param1.y_)
               {
                  _loc4_.writeByte(_loc6_);
               }
               else
               {
                  _loc3_ = _loc5_.squares_[_loc2_ + _loc7_ * _loc5_.width_];
                  if(_loc3_ == null || _loc3_.props_._M_m <= param1.props_._M_m)
                  {
                     _loc4_.writeByte(_loc6_);
                  }
                  else
                  {
                     _loc4_.writeByte(_loc3_.tileType_);
                  }
               }
               _loc2_++;
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      private static function _06F_() : Vector.<Vector.<_n5>>
      {
         var _loc1_:Vector.<Vector.<_n5>> = new Vector.<Vector.<_n5>>();
         _0F_S_(_loc1_,TextureLibrary._0R_8("inner_mask"),TextureLibrary._0R_8("sides_mask"),TextureLibrary._0R_8("outer_mask"),TextureLibrary._0R_8("innerP1_mask"),TextureLibrary._0R_8("innerP2_mask"));
         return _loc1_;
      }
      
      private static function _0F_S_(param1:Vector.<Vector.<_n5>>, param2:_n5, param3:_n5, param4:_n5, param5:_n5, param6:_n5) : void
      {
         var _loc7_:int = 0;
         for each(_loc7_ in [-1,0,2,1])
         {
            param1.push(new <_n5>[_1G_D_(param2,_loc7_),_1G_D_(param3,_loc7_ - 1),_1G_D_(param3,_loc7_),_1G_D_(param4,_loc7_),_1G_D_(param5,_loc7_),_1G_D_(param6,_loc7_)]);
         }
      }
      
      private static function _1G_D_(param1:_n5, param2:int) : _n5
      {
         var _loc3_:BitmapData = null;
         var _loc4_:_n5 = new _n5();
         for each(_loc3_ in param1._0D_y)
         {
            _loc4_.add(BitmapUtil._P_U_(_loc3_,param2));
         }
         return _loc4_;
      }
      
      private static function _0N_V_(param1:Square) : ByteArray
      {
         var _loc2_:Square = null;
         var _loc3_:Square = null;
         var _loc4_:Square = null;
         var _loc5_:Square = null;
         var _loc6_:ByteArray = new ByteArray();
         _loc6_.length = 4;
         var _loc7_:Map = param1.map_;
         var _loc8_:int = param1.x_;
         var _loc9_:int = param1.y_;
         var _loc10_:Square = _loc7_.lookupSquare(_loc8_,_loc9_ - 1);
         var _loc11_:Square = _loc7_.lookupSquare(_loc8_ - 1,_loc9_);
         var _loc12_:Square = _loc7_.lookupSquare(_loc8_ + 1,_loc9_);
         var _loc13_:Square = _loc7_.lookupSquare(_loc8_,_loc9_ + 1);
         var _loc14_:int = _loc10_ != null?int(_loc10_.props_._15W_):-1;
         var _loc15_:int = _loc11_ != null?int(_loc11_.props_._15W_):-1;
         var _loc16_:int = _loc12_ != null?int(_loc12_.props_._15W_):-1;
         var _loc17_:int = _loc13_ != null?int(_loc13_.props_._15W_):-1;
         if(_loc14_ < 0 && _loc15_ < 0)
         {
            _loc2_ = _loc7_.lookupSquare(_loc8_ - 1,_loc9_ - 1);
            _loc6_[0] = _loc2_ == null || _loc2_.props_._15W_ < 0?255:_loc2_.tileType_;
         }
         else if(_loc14_ < _loc15_)
         {
            _loc6_[0] = _loc11_.tileType_;
         }
         else
         {
            _loc6_[0] = _loc10_.tileType_;
         }
         if(_loc14_ < 0 && _loc16_ < 0)
         {
            _loc3_ = _loc7_.lookupSquare(_loc8_ + 1,_loc9_ - 1);
            _loc6_[1] = _loc3_ == null || _loc3_.props_._15W_ < 0?255:_loc3_.tileType_;
         }
         else if(_loc14_ < _loc16_)
         {
            _loc6_[1] = _loc12_.tileType_;
         }
         else
         {
            _loc6_[1] = _loc10_.tileType_;
         }
         if(_loc15_ < 0 && _loc17_ < 0)
         {
            _loc4_ = _loc7_.lookupSquare(_loc8_ - 1,_loc9_ + 1);
            _loc6_[2] = _loc4_ == null || _loc4_.props_._15W_ < 0?255:_loc4_.tileType_;
         }
         else if(_loc15_ < _loc17_)
         {
            _loc6_[2] = _loc13_.tileType_;
         }
         else
         {
            _loc6_[2] = _loc11_.tileType_;
         }
         if(_loc16_ < 0 && _loc17_ < 0)
         {
            _loc5_ = _loc7_.lookupSquare(_loc8_ + 1,_loc9_ + 1);
            _loc6_[3] = _loc5_ == null || _loc5_.props_._15W_ < 0?255:_loc5_.tileType_;
         }
         else if(_loc16_ < _loc17_)
         {
            _loc6_[3] = _loc13_.tileType_;
         }
         else
         {
            _loc6_[3] = _loc12_.tileType_;
         }
         return _loc6_;
      }
      
      private static function _0H_M_(param1:ByteArray) : BitmapData
      {
         var _loc2_:BitmapData = null;
         var _loc3_:BitmapData = new _1wr(8,8,false,0);
         if(param1[0] != 255)
         {
            _loc2_ = GroundLibrary.getBitmapData(param1[0]);
            _loc3_.copyPixels(_loc2_,RECT0,POINT0);
         }
         if(param1[1] != 255)
         {
            _loc2_ = GroundLibrary.getBitmapData(param1[1]);
            _loc3_.copyPixels(_loc2_,RECT1,POINT1);
         }
         if(param1[2] != 255)
         {
            _loc2_ = GroundLibrary.getBitmapData(param1[2]);
            _loc3_.copyPixels(_loc2_,RECT2,POINT2);
         }
         if(param1[3] != 255)
         {
            _loc2_ = GroundLibrary.getBitmapData(param1[3]);
            _loc3_.copyPixels(_loc2_,RECT3,POINT3);
         }
         return _loc3_;
      }
      
      private static function _173(param1:Square) : ByteArray
      {
         var _loc2_:int = 0;
         var _loc3_:Square = null;
         var _loc4_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc5_:ByteArray = new ByteArray();
         var _loc6_:Map = param1.map_;
         var _loc8_:Boolean = param1.props_._yD_;
         var _loc9_:int = param1.y_ - 1;
         while(_loc9_ <= param1.y_ + 1)
         {
            _loc2_ = param1.x_ - 1;
            while(_loc2_ <= param1.x_ + 1)
            {
               _loc3_ = _loc6_.lookupSquare(_loc2_,_loc9_);
               if(_loc2_ == param1.x_ && _loc9_ == param1.y_)
               {
                  _loc5_.writeByte(_loc3_.tileType_);
               }
               else
               {
                  if(_loc8_)
                  {
                     _loc4_ = _loc3_ == null || _loc3_.tileType_ == param1.tileType_;
                  }
                  else
                  {
                     _loc4_ = _loc3_ == null || _loc3_.tileType_ != 255;
                  }
                  _loc5_.writeBoolean(_loc4_);
                  _loc7_ = _loc7_ || !_loc4_;
               }
               _loc2_++;
            }
            _loc9_++;
         }
         return !!_loc7_?_loc5_:null;
      }
      
      private static function _1dG_(param1:ByteArray) : BitmapData
      {
         var _loc2_:BitmapData = GroundLibrary.getBitmapData(param1[4]);
         var _loc3_:BitmapData = _loc2_.clone();
         var _loc4_:_71 = GroundLibrary._01A_[param1[4]];
         var _loc5_:Vector.<BitmapData> = _loc4_._18j();
         var _loc6_:Vector.<BitmapData> = _loc4_._09E_();
         var _loc7_:int = 1;
         while(_loc7_ < 8)
         {
            if(!param1[_loc7_])
            {
               _loc3_.copyPixels(_loc5_[_loc7_],_loc5_[_loc7_].rect,PointUtil._17Q_,null,null,true);
            }
            _loc7_ = _loc7_ + 2;
         }
         if(_loc5_[0] != null)
         {
            if(param1[3] && param1[1] && !param1[0])
            {
               _loc3_.copyPixels(_loc5_[0],_loc5_[0].rect,PointUtil._17Q_,null,null,true);
            }
            if(param1[1] && param1[5] && !param1[2])
            {
               _loc3_.copyPixels(_loc5_[2],_loc5_[2].rect,PointUtil._17Q_,null,null,true);
            }
            if(param1[5] && param1[7] && !param1[8])
            {
               _loc3_.copyPixels(_loc5_[8],_loc5_[8].rect,PointUtil._17Q_,null,null,true);
            }
            if(param1[3] && param1[7] && !param1[6])
            {
               _loc3_.copyPixels(_loc5_[6],_loc5_[6].rect,PointUtil._17Q_,null,null,true);
            }
         }
         if(_loc6_ != null)
         {
            if(!param1[3] && !param1[1])
            {
               _loc3_.copyPixels(_loc6_[0],_loc6_[0].rect,PointUtil._17Q_,null,null,true);
            }
            if(!param1[1] && !param1[5])
            {
               _loc3_.copyPixels(_loc6_[2],_loc6_[2].rect,PointUtil._17Q_,null,null,true);
            }
            if(!param1[5] && !param1[7])
            {
               _loc3_.copyPixels(_loc6_[8],_loc6_[8].rect,PointUtil._17Q_,null,null,true);
            }
            if(!param1[3] && !param1[7])
            {
               _loc3_.copyPixels(_loc6_[6],_loc6_[6].rect,PointUtil._17Q_,null,null,true);
            }
         }
         return _loc3_;
      }
   }
}
