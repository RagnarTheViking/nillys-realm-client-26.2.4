package _0S_w
{
   import flash.display.Sprite;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import flash.display.Shape;
   import com.company.util.IntPoint;
   import flash.geom.Rectangle;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import com.company.util.Keys;
   import com.company.assembleegameclient.map.GroundLibrary;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.map.RegionLibrary;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   import com.company.util.PointUtil;
   import flash.display.Bitmap;
   import com.company.util.TextureLibrary;
   
   class _056 extends Sprite
   {
      
      public static const _0eO_:int = 512;
      
      public static const _09B_:int = 16;
      
      public static const _0lO_:int = 512;
      
      public static const _1c2:Number = 0.0625;
      
      public static const _3G_:Number = 16;
      
      private static var _0Q_i:Class = _0eN_;
      
      private static var _0A_n:BitmapData = new _0Q_i().bitmapData;
       
      
      public var _03F_:Dictionary;
      
      public var _1F_g:_0S_w._pD_;
      
      public var _1kX_:BitmapData;
      
      public var map_:BitmapData;
      
      public var _09c:Shape;
      
      public var _134:IntPoint;
      
      public var _c9:Number = 1;
      
      private var _bQ_:IntPoint = null;
      
      private var _1F_o:IntPoint = null;
      
      private var _I_Z_:BitmapData;
      
      private var _0hZ_:BitmapData;
      
      function _056()
      {
         this._03F_ = new Dictionary();
         this._1F_g = new _0S_w._pD_(_0eO_ * _09B_,_0eO_ * _09B_,true,0);
         this._1kX_ = new _1wr(_0eO_,_0eO_,true,0);
         this.map_ = new _1wr(_0lO_,_0lO_,true,0);
         this._09c = new Shape();
         super();
         graphics.beginBitmapFill(_0A_n,null,true);
         graphics.drawRect(0,0,_0lO_,_0lO_);
         addChild(new Bitmap(this.map_));
         addChild(this._09c);
         this._134 = new IntPoint(_0eO_ / 2 - this._0t4() / 2,_0eO_ / 2 - this._0t4() / 2);
         this._I_Z_ = TextureLibrary.getBitmap("invisible",0);
         this._0hZ_ = TextureLibrary.getBitmap("lofiObj3",255);
         this.draw();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function getType(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:_l4 = this._1r6(param1,param2);
         if(_loc4_ == null)
         {
            return -1;
         }
         return _loc4_._155[param3];
      }
      
      public function _1r6(param1:int, param2:int) : _l4
      {
         return this._03F_[param1 + param2 * _0eO_];
      }
      
      public function _yE_(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:_l4 = this._0xQ_(param1,param2);
         if(_loc5_._155[param3] == param4)
         {
            return;
         }
         _loc5_._155[param3] = param4;
         this._0U_0(param1,param2,_loc5_);
      }
      
      public function _0F_L_(param1:int, param2:int) : String
      {
         var _loc3_:_l4 = this._1r6(param1,param2);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_._09t;
      }
      
      public function _1I_T_(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:_l4 = this._0xQ_(param1,param2);
         _loc4_._09t = param3;
      }
      
      public function _xi() : Vector.<IntPoint>
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:Vector.<IntPoint> = new Vector.<IntPoint>();
         for(_loc1_ in this._03F_)
         {
            _loc2_ = int(_loc1_);
            _loc3_.push(new IntPoint(_loc2_ % _0eO_,_loc2_ / _0eO_));
         }
         return _loc3_;
      }
      
      public function _10n(param1:int, param2:int, param3:_l4) : void
      {
         param3 = param3.clone();
         this._03F_[param1 + param2 * _0eO_] = param3;
         this._0U_0(param1,param2,param3);
      }
      
      public function _0Z_B_(param1:int, param2:int) : void
      {
         this._0lr(param1,param2);
         this._0U_0(param1,param2,null);
      }
      
      public function clear() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         for(_loc1_ in this._03F_)
         {
            _loc2_ = int(_loc1_);
            this._0Z_B_(_loc2_ % _0eO_,_loc2_ / _0eO_);
         }
      }
      
      public function _0E_U_() : Rectangle
      {
         var _loc1_:* = null;
         var _loc2_:_l4 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:int = _0eO_;
         var _loc7_:int = _0eO_;
         for(_loc1_ in this._03F_)
         {
            _loc2_ = this._03F_[_loc1_];
            if(!_loc2_.isEmpty())
            {
               _loc3_ = int(_loc1_);
               _loc4_ = _loc3_ % _0eO_;
               _loc5_ = _loc3_ / _0eO_;
               if(_loc4_ < _loc6_)
               {
                  _loc6_ = _loc4_;
               }
               if(_loc5_ < _loc7_)
               {
                  _loc7_ = _loc5_;
               }
               if(_loc4_ + 1 > _loc8_)
               {
                  _loc8_ = _loc4_ + 1;
               }
               if(_loc5_ + 1 > _loc9_)
               {
                  _loc9_ = _loc5_ + 1;
               }
            }
         }
         if(_loc6_ > _loc8_)
         {
            return null;
         }
         return new Rectangle(_loc6_,_loc7_,_loc8_ - _loc6_,_loc9_ - _loc7_);
      }
      
      private function _0t4() : int
      {
         return _0lO_ / (_09B_ * this._c9);
      }
      
      private function _0bn(param1:Number) : void
      {
         if(param1 > 1 && this._c9 >= _3G_ || param1 < 1 && this._c9 <= _1c2)
         {
            return;
         }
         var _loc2_:IntPoint = this._1kt();
         this._c9 = this._c9 * param1;
         var _loc3_:IntPoint = this._1kt();
         this._0L_M_(_loc2_.x_ - _loc3_.x_,_loc2_.y_ - _loc3_.y_);
      }
      
      private function _xg() : Boolean
      {
         return this._bQ_ == null && this._1F_o == null;
      }
      
      private function _2__A_() : void
      {
         if(!this._xg())
         {
            return;
         }
         this._0bn(2);
         this.draw();
      }
      
      private function _I_U_() : void
      {
         if(!this._xg())
         {
            return;
         }
         this._0bn(0.5);
         this.draw();
      }
      
      private function moveLeft() : void
      {
         if(!this._xg())
         {
            return;
         }
         this._0L_M_(-1,0);
         this.draw();
      }
      
      private function moveRight() : void
      {
         if(!this._xg())
         {
            return;
         }
         this._0L_M_(1,0);
         this.draw();
      }
      
      private function moveUp() : void
      {
         if(!this._xg())
         {
            return;
         }
         this._0L_M_(0,-1);
         this.draw();
      }
      
      private function moveDown() : void
      {
         if(!this._xg())
         {
            return;
         }
         this._0L_M_(0,1);
         this.draw();
      }
      
      private function _0L_M_(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = _0eO_ - this._0t4();
         this._134.x_ = Math.max(_loc3_,Math.min(_loc4_,this._134.x_ + param1));
         this._134.y_ = Math.max(_loc3_,Math.min(_loc4_,this._134.y_ + param2));
      }
      
      private function _1kt() : IntPoint
      {
         var _loc1_:int = Math.max(0,Math.min(_0lO_ - 1,mouseX));
         var _loc2_:int = Math.max(0,Math.min(_0lO_ - 1,mouseY));
         return new IntPoint(this._134.x_ + _loc1_ / (_09B_ * this._c9),this._134.y_ + _loc2_ / (_09B_ * this._c9));
      }
      
      public function _0kl() : Rectangle
      {
         var _loc1_:IntPoint = this._1kt();
         if(this._bQ_ == null)
         {
            return new Rectangle(_loc1_.x_,_loc1_.y_,1,1);
         }
         return new Rectangle(Math.min(_loc1_.x_,this._bQ_.x_),Math.min(_loc1_.y_,this._bQ_.y_),Math.abs(_loc1_.x_ - this._bQ_.x_) + 1,Math.abs(_loc1_.y_ - this._bQ_.y_) + 1);
      }
      
      private function _N_(param1:IntPoint) : IntPoint
      {
         return new IntPoint((param1.x_ - this._134.x_) * _09B_ * this._c9,(param1.y_ - this._134.y_) * _09B_ * this._c9);
      }
      
      private function _qa(param1:int) : Number
      {
         return param1 * this._c9 * _09B_;
      }
      
      private function _0M_V_() : Rectangle
      {
         var _loc1_:Rectangle = this._0kl();
         var _loc2_:IntPoint = this._N_(new IntPoint(_loc1_.x,_loc1_.y));
         _loc1_.x = _loc2_.x_;
         _loc1_.y = _loc2_.y_;
         _loc1_.width = this._qa(_loc1_.width) - 1;
         _loc1_.height = this._qa(_loc1_.height) - 1;
         return _loc1_;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         addEventListener(MouseEvent.MOUSE_WHEEL,this._1b2);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         stage.addEventListener(KeyboardEvent.KEY_UP,this._C_6);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(MouseEvent.MOUSE_WHEEL,this._1b2);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this._C_6);
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.SHIFT:
               if(this._bQ_ != null)
               {
                  break;
               }
               this._bQ_ = this._1kt();
               break;
            case Keyboard.CONTROL:
               if(this._1F_o != null)
               {
                  break;
               }
               this._1F_o = this._1kt();
               break;
            case Keyboard.LEFT:
               this.moveLeft();
               break;
            case Keyboard.RIGHT:
               this.moveRight();
               break;
            case Keyboard.UP:
               this.moveUp();
               break;
            case Keyboard.DOWN:
               this.moveDown();
               break;
            case Keys._1C_u:
               this._I_U_();
               break;
            case Keys._u3:
               this._2__A_();
         }
         this.draw();
      }
      
      private function _C_6(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.SHIFT:
               this._bQ_ = null;
               break;
            case Keyboard.CONTROL:
               this._1F_o = null;
         }
         this.draw();
      }
      
      private function _1b2(param1:MouseEvent) : void
      {
         if(param1.delta > 0)
         {
            this._2__A_();
         }
         else if(param1.delta < 0)
         {
            this._I_U_();
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Rectangle = this._0kl();
         var _loc4_:Vector.<IntPoint> = new Vector.<IntPoint>();
         var _loc5_:int = _loc3_.x;
         while(_loc5_ < _loc3_.right)
         {
            _loc2_ = _loc3_.y;
            while(_loc2_ < _loc3_.bottom)
            {
               _loc4_.push(new IntPoint(_loc5_,_loc2_));
               _loc2_++;
            }
            _loc5_++;
         }
         dispatchEvent(new _2i(_loc4_));
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:IntPoint = null;
         if(!param1.shiftKey)
         {
            this._bQ_ = null;
         }
         else if(this._bQ_ == null)
         {
            this._bQ_ = this._1kt();
         }
         if(!param1.ctrlKey)
         {
            this._1F_o = null;
         }
         else if(this._1F_o == null)
         {
            this._1F_o = this._1kt();
         }
         if(param1.buttonDown)
         {
            dispatchEvent(new _2i(new <IntPoint>[this._1kt()]));
         }
         if(this._1F_o != null)
         {
            _loc2_ = this._1kt();
            this._0L_M_(this._1F_o.x_ - _loc2_.x_,this._1F_o.y_ - _loc2_.y_);
            this.draw();
         }
         else
         {
            this._1yk();
         }
      }
      
      private function _0xQ_(param1:int, param2:int) : _l4
      {
         var _loc3_:int = param1 + param2 * _0eO_;
         var _loc4_:_l4 = this._03F_[_loc3_];
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         _loc4_ = new _l4();
         this._03F_[_loc3_] = _loc4_;
         return _loc4_;
      }
      
      private function _0lr(param1:int, param2:int) : void
      {
         delete this._03F_[param1 + param2 * _0eO_];
      }
      
      private function _0U_0(param1:int, param2:int, param3:_l4) : void
      {
         var _loc4_:BitmapData = null;
         var _loc5_:BitmapData = null;
         var _loc6_:uint = 0;
         var _loc7_:Rectangle = new Rectangle(param1 * _09B_,param2 * _09B_,_09B_,_09B_);
         this._1F_g._L_V_(_loc7_);
         this._1kX_.setPixel32(param1,param2,0);
         if(param3 == null)
         {
            return;
         }
         if(param3._155[_F_B_._1Z_v] != -1)
         {
            _loc4_ = GroundLibrary.getBitmapData(param3._155[_F_B_._1Z_v]);
            this._1F_g.copyTo(_loc4_,_loc4_.rect,_loc7_);
         }
         if(param3._155[_F_B_._W_a] != -1)
         {
            _loc5_ = ObjectLibrary.getTextureFromType(param3._155[_F_B_._W_a]);
            if(_loc5_ == null || _loc5_ == this._I_Z_)
            {
               this._1F_g.copyTo(this._0hZ_,this._0hZ_.rect,_loc7_);
            }
            else
            {
               this._1F_g.copyTo(_loc5_,_loc5_.rect,_loc7_);
            }
         }
         if(param3._155[_F_B_._V_4] != -1)
         {
            _loc6_ = RegionLibrary.getColor(param3._155[_F_B_._V_4]);
            this._1kX_.setPixel32(param1,param2,1593835520 | _loc6_);
         }
      }
      
      private function _1yk() : void
      {
         var _loc1_:Rectangle = this._0M_V_();
         var _loc2_:Graphics = this._09c.graphics;
         _loc2_.clear();
         _loc2_.lineStyle(1,16777215);
         _loc2_.beginFill(16777215,0.1);
         _loc2_.drawRect(_loc1_.x,_loc1_.y,_loc1_.width,_loc1_.height);
         _loc2_.endFill();
         _loc2_.lineStyle();
      }
      
      public function draw() : void
      {
         var _loc1_:Matrix = null;
         var _loc2_:int = 0;
         var _loc3_:BitmapData = null;
         var _loc4_:int = _0lO_ / this._c9;
         this.map_.fillRect(this.map_.rect,0);
         this._1F_g._0T_l(new Rectangle(this._134.x_ * _09B_,this._134.y_ * _09B_,_loc4_,_loc4_),this.map_,this.map_.rect);
         _loc1_ = new Matrix();
         _loc1_.identity();
         _loc2_ = _09B_ * this._c9;
         if(this._c9 > 2)
         {
            _loc3_ = new _1wr(_0lO_ / _loc2_,_0lO_ / _loc2_);
            _loc3_.copyPixels(this._1kX_,new Rectangle(this._134.x_,this._134.y_,_loc4_,_loc4_),PointUtil._17Q_);
            _loc1_.scale(_loc2_,_loc2_);
            this.map_.draw(_loc3_,_loc1_);
         }
         else
         {
            _loc1_.translate(-this._134.x_,-this._134.y_);
            _loc1_.scale(_loc2_,_loc2_);
            this.map_.draw(this._1kX_,_loc1_,null,null,this.map_.rect);
         }
         this._1yk();
      }
   }
}
