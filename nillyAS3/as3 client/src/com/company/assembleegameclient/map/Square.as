package com.company.assembleegameclient.map
{
   import flash.geom.Vector3D;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.engine3d.TextureMatrix;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.util._1H_f;
   
   public class Square
   {
      
      public static const _Y_r:Vector.<Number> = new <Number>[0,0,0,1,0,0,1,1,0,0,1,0];
      
      private static const _vg:Vector.<int> = new <int>[26171,44789,20333,70429,98257,59393,33961];
       
      
      public var map_:com.company.assembleegameclient.map.Map;
      
      public var x_:int;
      
      public var y_:int;
      
      public var tileType_:uint = 255;
      
      public var center_:Vector3D;
      
      public var _1cQ_:Vector.<Number>;
      
      public var obj_:GameObject = null;
      
      public var props_:com.company.assembleegameclient.map._71;
      
      public var texture_:BitmapData = null;
      
      public var sink_:int = 0;
      
      public var lastDamage_:int = 0;
      
      public var faces_:Vector.<com.company.assembleegameclient.map.GroundTile>;
      
      public var animation:com.company.assembleegameclient.map.GroundTile = null;
      
      public var baseTexMatrix_:TextureMatrix = null;
      
      public var drawTime:int;
      
      public function Square(param1:com.company.assembleegameclient.map.Map, param2:int, param3:int)
      {
         this.props_ = GroundLibrary._0Y_5;
         this.faces_ = new Vector.<com.company.assembleegameclient.map.GroundTile>();
         super();
         this.map_ = param1;
         this.x_ = param2;
         this.y_ = param3;
         this.center_ = new Vector3D(this.x_ + 0.5,this.y_ + 0.5,0);
         this._1cQ_ = new <Number>[this.x_,this.y_,0,this.x_ + 1,this.y_,0,this.x_ + 1,this.y_ + 1,0,this.x_,this.y_ + 1,0];
      }
      
      private static function hash(param1:int, param2:int) : int
      {
         var _loc3_:int = _vg[(param1 + param2) % 7];
         var _loc4_:* = (param1 << 16 | param2) ^ 81397550;
         _loc4_ = _loc4_ * _loc3_ % 65535;
         return _loc4_;
      }
      
      public function dispose() : void
      {
         var _loc1_:com.company.assembleegameclient.map.GroundTile = null;
         this.map_ = null;
         this.center_ = null;
         this._1cQ_ = null;
         this.obj_ = null;
         this.texture_ = null;
         for each(_loc1_ in this.faces_)
         {
            _loc1_.dispose();
         }
         this.faces_.length = 0;
         if(this.animation != null)
         {
            this.animation.dispose();
            this.animation = null;
         }
         this.faces_ = null;
         this.baseTexMatrix_ = null;
      }
      
      public function _fY_(param1:uint) : void
      {
         this.tileType_ = param1;
         this.props_ = GroundLibrary._01A_[this.tileType_];
         this.texture_ = GroundLibrary.getBitmapData(this.tileType_,hash(this.x_,this.y_));
         this.baseTexMatrix_ = new TextureMatrix(this.texture_,_Y_r);
         this.faces_.length = 0;
      }
      
      public function passable() : Boolean
      {
         return !this.props_.noWalk_ && (this.obj_ == null || !this.obj_.props_.occupySquare_);
      }
      
      public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         var _loc4_:com.company.assembleegameclient.map.GroundTile = null;
         if(this.texture_ == null)
         {
            return;
         }
         if(this.faces_.length == 0)
         {
            this._0hp();
         }
         for each(_loc4_ in this.faces_)
         {
            if(!_loc4_.draw(param1,param2,param3))
            {
               if(_loc4_.face_.vout_[1] < param2.rect.bottom)
               {
                  this.drawTime = 0;
               }
               return;
            }
         }
      }
      
      public function animate(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         this.animation.draw(param1,param2,param3);
      }
      
      private function _0hp() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:BitmapData = null;
         var _loc4_:Vector.<Number> = null;
         var _loc5_:uint = 0;
         var _loc6_:BitmapData = null;
         this.faces_.length = 0;
         this.animation = null;
         if(this.props_.animate_.type_ != GroundAnimation.NONE)
         {
            this.faces_.push(new com.company.assembleegameclient.map.GroundTile(this.texture_,this._1cQ_,this.props_.xOffset_,this.props_.xOffset_,this.props_.animate_.type_,this.props_.animate_.dx_,this.props_.animate_.dy_));
            _loc6_ = _1H_f.redraw(this,false);
            if(_loc6_ != null)
            {
               this.faces_.push(new com.company.assembleegameclient.map.GroundTile(_loc6_,this._1cQ_,0,0,GroundAnimation.NONE,0,0));
            }
         }
         else
         {
            _loc6_ = _1H_f.redraw(this,true);
            _loc1_ = 0;
            _loc2_ = 0;
            if(_loc6_ == null)
            {
               if(this.props_.randomOffset_)
               {
                  _loc1_ = int(this.texture_.width * Math.random()) / this.texture_.width;
                  _loc2_ = int(this.texture_.height * Math.random()) / this.texture_.height;
               }
               else
               {
                  _loc1_ = this.props_.xOffset_;
                  _loc2_ = this.props_.yOffset_;
               }
            }
            this.faces_.push(new com.company.assembleegameclient.map.GroundTile(_loc6_ != null?_loc6_:this.texture_,this._1cQ_,_loc1_,_loc2_,GroundAnimation.NONE,0,0));
         }
         if(this.props_.sink_)
         {
            this.sink_ = _loc6_ == null?12:6;
         }
         else
         {
            this.sink_ = 0;
         }
         if(this.props_._kK_)
         {
            _loc3_ = this.props_._kK_.getTexture();
            _loc4_ = this._1cQ_.concat();
            _loc5_ = 2;
            while(_loc5_ < _loc4_.length)
            {
               _loc4_[_loc5_] = 1;
               _loc5_ = _loc5_ + 3;
            }
            this.animation = new com.company.assembleegameclient.map.GroundTile(_loc3_,_loc4_,0,0,this.props_._sd.type_,this.props_._sd.dx_,this.props_._sd.dy_);
         }
      }
   }
}
