package _qO_
{
   import flash.display.Sprite;
   import _2F_.Console;
   import _2F_._0__X_;
   import flash.geom.Rectangle;
   import flash.display.Shape;
   import flash.text.TextField;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Point;
   import _2F_._wR_;
   import flash.ui.Mouse;
   import flash.events.Event;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.text.TextFieldAutoSize;
   import flash.display.Graphics;
   
   public class _1xe extends Sprite
   {
       
      
      private var _1L_L_:Console;
      
      private var _config:_0__X_;
      
      private var _0fo:Rectangle;
      
      private var _1T_X_:Shape;
      
      private var _0B_U_:TextField;
      
      private var _1zX_:Bitmap;
      
      private var _0eU_:Array;
      
      public function _1xe(param1:Console)
      {
         super();
         this._1L_L_ = param1;
         this._config = param1.config;
         buttonMode = true;
         this._0eU_ = new Array();
         this._1T_X_ = new Shape();
         addChild(this._1T_X_);
         var _loc2_:Point = new Point();
         _loc2_ = globalToLocal(_loc2_);
         param1.stage;
         param1.stage;
         param1.stage;
         param1.stage;
         this._0fo = new Rectangle(-800 * 1.5 + _loc2_.x,-600 * 1.5 + _loc2_.y,800 * 3,600 * 3);
         graphics.beginFill(this._config.style.backgroundColor,0.2);
         graphics.drawRect(this._0fo.x,this._0fo.y,this._0fo.width,this._0fo.height);
         graphics.endFill();
         this._0B_U_ = this._1L_L_.panels.mainPanel._1ae("positionText",true);
         this._0B_U_.autoSize = TextFieldAutoSize.LEFT;
         addChild(this._0B_U_);
         this._1zX_ = new Bitmap();
         this._1zX_.scaleY = this._1zX_.scaleX = 2;
         addChild(this._1zX_);
         addEventListener(MouseEvent.CLICK,this._0cy,false,0,true);
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove,false,0,true);
         this.onMouseMove();
         if(this._config._0I_F_)
         {
            Mouse.hide();
         }
         this._1L_L_.report("<b>Ruler started. Click on two locations to measure.</b>",-1);
      }
      
      private function onMouseMove(param1:MouseEvent = null) : void
      {
         var m:Matrix = null;
         var e:MouseEvent = param1;
         this._1T_X_.graphics.clear();
         this._1T_X_.graphics.lineStyle(1,11193344,1);
         this._1T_X_.graphics.moveTo(this._0fo.x,mouseY);
         this._1T_X_.graphics.lineTo(this._0fo.x + this._0fo.width,mouseY);
         this._1T_X_.graphics.moveTo(mouseX,this._0fo.y);
         this._1T_X_.graphics.lineTo(mouseX,this._0fo.y + this._0fo.height);
         this._1T_X_.blendMode = BlendMode.INVERT;
         this._0B_U_.text = "<low>" + mouseX + "," + mouseY + "</low>";
         var bmd:BitmapData = new BitmapData(30,30);
         try
         {
            m = new Matrix();
            m.tx = -stage.mouseX + 15;
            m.ty = -stage.mouseY + 15;
            bmd.draw(stage,m);
         }
         catch(err:Error)
         {
            bmd = null;
         }
         this._1zX_.bitmapData = bmd;
         var d:int = 10;
         this._0B_U_.x = mouseX - this._0B_U_.width - d;
         this._0B_U_.y = mouseY - this._0B_U_.height - d;
         this._1zX_.x = this._0B_U_.x + this._0B_U_.width - this._1zX_.width;
         this._1zX_.y = this._0B_U_.y - this._1zX_.height;
         if(this._0B_U_.x < 16)
         {
            this._0B_U_.x = mouseX + d;
            this._1zX_.x = this._0B_U_.x;
         }
         if(this._0B_U_.y < 38)
         {
            this._0B_U_.y = mouseY + d;
            this._1zX_.y = this._0B_U_.y + this._0B_U_.height;
         }
      }
      
      private function _0cy(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:TextField = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         param1.stopPropagation();
         var _loc15_:_wR_ = this._config.style;
         if(this._0eU_.length == 0)
         {
            _loc2_ = new Point(param1.localX,param1.localY);
            graphics.lineStyle(1,16711680);
            graphics.drawCircle(_loc2_.x,_loc2_.y,3);
            this._0eU_.push(_loc2_);
         }
         else if(this._0eU_.length == 1)
         {
            this._1zX_.bitmapData = null;
            if(this._config._0I_F_)
            {
               Mouse.show();
            }
            removeChild(this._1T_X_);
            removeChild(this._0B_U_);
            removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            _loc2_ = this._0eU_[0];
            _loc3_ = new Point(param1.localX,param1.localY);
            this._0eU_.push(_loc3_);
            graphics.clear();
            graphics.beginFill(_loc15_.backgroundColor,0.4);
            graphics.drawRect(this._0fo.x,this._0fo.y,this._0fo.width,this._0fo.height);
            graphics.endFill();
            graphics.lineStyle(1.5,16711680);
            graphics.drawCircle(_loc2_.x,_loc2_.y,4);
            graphics.lineStyle(1.5,16750848);
            graphics.drawCircle(_loc3_.x,_loc3_.y,4);
            _loc4_ = Point.interpolate(_loc2_,_loc3_,0.5);
            graphics.lineStyle(1,11184810);
            graphics.drawCircle(_loc4_.x,_loc4_.y,4);
            _loc5_ = _loc2_;
            _loc6_ = _loc3_;
            if(_loc2_.x > _loc3_.x)
            {
               _loc5_ = _loc3_;
               _loc6_ = _loc2_;
            }
            _loc7_ = _loc2_;
            _loc8_ = _loc3_;
            if(_loc2_.y > _loc3_.y)
            {
               _loc7_ = _loc3_;
               _loc8_ = _loc2_;
            }
            _loc9_ = _loc6_.x - _loc5_.x;
            _loc10_ = _loc8_.y - _loc7_.y;
            _loc11_ = Point.distance(_loc2_,_loc3_);
            _loc12_ = this._D_T_(_loc15_.highColor);
            _loc12_.text = this.round(_loc2_.x) + "," + this.round(_loc2_.y);
            _loc12_.x = _loc2_.x;
            _loc12_.y = _loc2_.y - (_loc7_ == _loc2_?14:0);
            addChild(_loc12_);
            _loc12_ = this._D_T_(_loc15_.highColor);
            _loc12_.text = this.round(_loc3_.x) + "," + this.round(_loc3_.y);
            _loc12_.x = _loc3_.x;
            _loc12_.y = _loc3_.y - (_loc7_ == _loc3_?14:0);
            addChild(_loc12_);
            if(_loc9_ > 40 || _loc10_ > 25)
            {
               _loc12_ = this._D_T_(_loc15_.lowColor);
               _loc12_.text = this.round(_loc4_.x) + "," + this.round(_loc4_.y);
               _loc12_.x = _loc4_.x;
               _loc12_.y = _loc4_.y;
               addChild(_loc12_);
            }
            graphics.lineStyle(1,11193344,0.5);
            graphics.moveTo(this._0fo.x,_loc7_.y);
            graphics.lineTo(this._0fo.x + this._0fo.width,_loc7_.y);
            graphics.moveTo(this._0fo.x,_loc8_.y);
            graphics.lineTo(this._0fo.x + this._0fo.width,_loc8_.y);
            graphics.moveTo(_loc5_.x,this._0fo.y);
            graphics.lineTo(_loc5_.x,this._0fo.y + this._0fo.height);
            graphics.moveTo(_loc6_.x,this._0fo.y);
            graphics.lineTo(_loc6_.x,this._0fo.y + this._0fo.height);
            _loc13_ = this.round(this.angle(_loc2_,_loc3_),100);
            _loc14_ = this.round(this.angle(_loc3_,_loc2_),100);
            graphics.lineStyle(1,11141120,0.8);
            this._0K_G_(graphics,10,_loc2_,_loc13_,-90);
            graphics.lineStyle(1,13404160,0.8);
            this._0K_G_(graphics,10,_loc3_,_loc14_,-90);
            graphics.lineStyle(2,65280,0.7);
            graphics.moveTo(_loc2_.x,_loc2_.y);
            graphics.lineTo(_loc3_.x,_loc3_.y);
            this._1L_L_.report("Ruler results: (red) <b>[" + _loc2_.x + "," + _loc2_.y + "]</b> to (orange) <b>[" + _loc3_.x + "," + _loc3_.y + "]</b>",-2);
            this._1L_L_.report("Distance: <b>" + this.round(_loc11_,100) + "</b>",-2);
            this._1L_L_.report("Mid point: <b>[" + _loc4_.x + "," + _loc4_.y + "]</b>",-2);
            this._1L_L_.report("Width:<b>" + _loc9_ + "</b>, Height: <b>" + _loc10_ + "</b>",-2);
            this._1L_L_.report("Angle from first point (red): <b>" + _loc13_ + "°</b>",-2);
            this._1L_L_.report("Angle from second point (orange): <b>" + _loc14_ + "°</b>",-2);
         }
         else
         {
            this.exit();
         }
      }
      
      public function exit() : void
      {
         this._1L_L_ = null;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function _D_T_(param1:Number, param2:Boolean = true) : TextField
      {
         var _loc3_:TextFormat = new TextFormat(this._config.style.menuFont,this._config.style.menuFontSize,param1,param2,true,null,null,TextFormatAlign.RIGHT);
         var _loc4_:TextField = new TextField();
         _loc4_.autoSize = TextFieldAutoSize.RIGHT;
         _loc4_.selectable = false;
         _loc4_.defaultTextFormat = _loc3_;
         return _loc4_;
      }
      
      private function round(param1:Number, param2:uint = 10) : Number
      {
         return Math.round(param1 * param2) / param2;
      }
      
      private function angle(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = Math.atan2(param2.y - param1.y,param2.x - param1.x) / Math.PI * 180;
         _loc3_ = _loc3_ + 90;
         if(_loc3_ > 180)
         {
            _loc3_ = _loc3_ - 360;
         }
         return _loc3_;
      }
      
      private function _0K_G_(param1:Graphics, param2:Number, param3:Point, param4:Number = 180, param5:Number = 0) : Point
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Point = null;
         var _loc10_:Boolean = false;
         if(param4 < 0)
         {
            _loc10_ = true;
            param4 = Math.abs(param4);
         }
         var _loc11_:Number = param4 * Math.PI / 180;
         var _loc12_:Number = param5 * Math.PI / 180;
         var _loc13_:Point = this._2d(param2,_loc12_);
         _loc13_.offset(param3.x,param3.y);
         param1.moveTo(_loc13_.x,_loc13_.y);
         var _loc14_:Number = 0;
         var _loc15_:int = 1;
         while(_loc15_ <= _loc11_ + 1)
         {
            _loc6_ = _loc15_ <= _loc11_?Number(_loc15_):Number(_loc11_);
            _loc7_ = _loc6_ - _loc14_;
            _loc8_ = 1 + 0.12 * _loc7_ * _loc7_;
            _loc9_ = this._2d(param2 * _loc8_,(_loc6_ - _loc7_ / 2) * (!!_loc10_?-1:1) + _loc12_);
            _loc9_.offset(param3.x,param3.y);
            _loc13_ = this._2d(param2,_loc6_ * (!!_loc10_?-1:1) + _loc12_);
            _loc13_.offset(param3.x,param3.y);
            param1.curveTo(_loc9_.x,_loc9_.y,_loc13_.x,_loc13_.y);
            _loc14_ = _loc6_;
            _loc15_++;
         }
         return _loc13_;
      }
      
      private function _2d(param1:Number, param2:Number) : Point
      {
         return new Point(param1 * Math.cos(param2),param1 * Math.sin(param2));
      }
   }
}
