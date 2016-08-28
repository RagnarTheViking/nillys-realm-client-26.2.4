package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import _1xa.SText;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.filters.DropShadowFilter;
   
   public class StatusBar extends Sprite
   {
      
      public static var _tf:Signal = new Signal(Boolean);
       
      
      public var w_:int;
      
      public var h_:int;
      
      public var color_:uint;
      
      public var _it:uint;
      
      public var _ti:uint;
      
      public var _6R_:uint;
      
      public var val_:int = -1;
      
      public var _D_B_:int = -1;
      
      public var boost_:int = -1;
      
      public var _bz:int = -1;
      
      private var labelText_:SimpleText;
      
      private var _0W_h:_dU_;
      
      private var _Y_m:SimpleText;
      
      private var _3c:SText;
      
      private var _0ii:SimpleText;
      
      private var _id:SimpleText;
      
      public var _1lP_:Sprite;
      
      private var _1L_V_:Sprite;
      
      private var _C_4:Number;
      
      private var _0fp:Number;
      
      public var _0K_Q_:Boolean = false;
      
      private var _1zr:Boolean = false;
      
      private var _0H_0:int;
      
      private var _0L_3:int = -1;
      
      private var speed:Number = 0.1;
      
      public function StatusBar(param1:int, param2:int, param3:uint, param4:uint, param5:String = null)
      {
         this._1L_V_ = new Sprite();
         super();
         addChild(this._1L_V_);
         this.w_ = param1;
         this.h_ = param2;
         this._C_4 = this.color_ = param3;
         this._0fp = this._it = param4;
         this._6R_ = 16777215;
         if(param5 != null && param5.length != 0)
         {
            this.labelText_ = new SimpleText().setSize(14).setColor(this._6R_);
            this.labelText_.setBold(true);
            this._0W_h = new _dU_().setParams(param5);
            this.labelText_.setStringBuilder(this._0W_h);
            this._03R_(this.labelText_);
            this.labelText_.filters = [new DropShadowFilter(0,0,0)];
            addChild(this.labelText_);
         }
         this._Y_m = new SimpleText().setSize(14).setColor(16777215);
         this._Y_m.setBold(true);
         this._Y_m.filters = [new DropShadowFilter(0,0,0)];
         this._03R_(this._Y_m);
         this._3c = new SText();
         this._0ii = new SimpleText().setSize(14).setColor(this._6R_);
         this._0ii.setBold(true);
         this._0ii.alpha = 0.6;
         this._03R_(this._0ii);
         this._0ii.filters = [new DropShadowFilter(0,0,0)];
         this._1lP_ = new Sprite();
         this._1lP_.x = this.w_ - 25;
         this._1lP_.y = -3;
         this._1lP_.graphics.beginFill(16711935,0);
         this._1lP_.graphics.drawRect(0,0,20,20);
         this._1lP_.addEventListener(MouseEvent.MOUSE_OVER,this._19l);
         this._1lP_.addEventListener(MouseEvent.MOUSE_OUT,this._J_X_);
         this._id = new SimpleText().setSize(14).setColor(9493531);
         this._id.setBold(true);
         this._id.setStringBuilder(new SText("x2"));
         this._id.filters = [new DropShadowFilter(0,0,0)];
         this._1lP_.addChild(this._id);
         if(!Parameters.data_.toggleBarText)
         {
            addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
            addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         }
         _tf.add(this._1ln);
      }
      
      public function _03R_(param1:SimpleText) : void
      {
         param1.setVerticalAlign(SimpleText.MIDDLE);
         param1.y = this.h_ / 2 + 1;
      }
      
      private function _19l(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("MULTIPLIER_OVER"));
      }
      
      private function _J_X_(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("MULTIPLIER_OUT"));
      }
      
      public function draw(param1:int, param2:int, param3:int, param4:int = -1) : void
      {
         if(param2 > 0)
         {
            param1 = Math.min(param2,Math.max(0,param1));
         }
         if(param1 == this.val_ && param2 == this._D_B_ && param3 == this.boost_ && param4 == this._bz)
         {
            return;
         }
         this.val_ = param1;
         this._D_B_ = param2;
         this.boost_ = param3;
         this._bz = param4;
         this._0P_5();
      }
      
      public function _4G_(param1:String, param2:Object = null) : void
      {
         this._0W_h.setParams(param1,param2);
         this.labelText_.setStringBuilder(this._0W_h);
      }
      
      private function _r(param1:uint) : void
      {
         this._6R_ = param1;
         if(this._0ii != null)
         {
            this._0ii.setColor(this._6R_);
         }
         this._Y_m.setColor(this._6R_);
      }
      
      public function _1ln(param1:Boolean) : void
      {
         this._0K_Q_ = false;
         if(param1)
         {
            removeEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
            removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         }
         else
         {
            addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
            addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         }
         this._0P_5();
      }
      
      private function _0P_5() : void
      {
         graphics.clear();
         this._1L_V_.graphics.clear();
         var _loc1_:uint = 16777215;
         if(this._bz > 0 && this._D_B_ - this.boost_ == this._bz)
         {
            _loc1_ = 16572160;
         }
         else if(this.boost_ > 0)
         {
            _loc1_ = 6206769;
         }
         if(this._6R_ != _loc1_)
         {
            this._r(_loc1_);
         }
         graphics.beginFill(this._it);
         graphics.drawRect(0,0,this.w_,this.h_);
         graphics.endFill();
         if(this._1zr)
         {
            this._1L_V_.graphics.beginFill(this._ti);
            this._1L_V_.graphics.drawRect(0,0,this.w_,this.h_);
         }
         this._1L_V_.graphics.beginFill(this.color_);
         if(this._D_B_ > 0)
         {
            this._1L_V_.graphics.drawRect(0,0,this.w_ * (this.val_ / this._D_B_),this.h_);
         }
         else
         {
            this._1L_V_.graphics.drawRect(0,0,this.w_,this.h_);
         }
         this._1L_V_.graphics.endFill();
         if(contains(this._Y_m))
         {
            removeChild(this._Y_m);
         }
         if(contains(this._0ii))
         {
            removeChild(this._0ii);
         }
         if(Parameters.data_.toggleBarText || this._0K_Q_ && this.h_ > 4)
         {
            this._1rs();
         }
      }
      
      public function _1rs() : void
      {
         if(this._D_B_ > 0)
         {
            this._Y_m.setStringBuilder(this._3c.setString(this.val_ + "/" + this._D_B_));
         }
         else
         {
            this._Y_m.setStringBuilder(this._3c.setString("" + this.val_));
         }
         if(!contains(this._Y_m))
         {
            addChild(this._Y_m);
         }
         if(this.boost_ != 0)
         {
            this._0ii.setStringBuilder(this._3c.setString(" (" + (this.boost_ > 0?"+":"") + this.boost_.toString() + ")"));
            if(!contains(this._0ii))
            {
               addChild(this._0ii);
            }
            this._Y_m.x = this.w_ / 2 - (this._Y_m.width + this._0ii.width) / 2;
            this._0ii.x = this._Y_m.x + this._Y_m.width;
         }
         else
         {
            this._Y_m.x = this.w_ / 2 - this._Y_m.width / 2;
            if(contains(this._0ii))
            {
               removeChild(this._0ii);
            }
         }
      }
      
      public function _0H_K_() : void
      {
         addChild(this._1lP_);
         this._05r(3,9493531,16777215);
      }
      
      public function _0I_R_() : void
      {
         if(this._1lP_.parent)
         {
            removeChild(this._1lP_);
         }
      }
      
      public function _05r(param1:Number, param2:Number, param3:Number) : void
      {
         this._1zr = true;
         this.color_ = param2;
         this._ti = param3;
         this._0H_0 = param1;
         this._0P_5();
         addEventListener(Event.ENTER_FRAME,this._06C_);
      }
      
      private function _06C_(param1:Event) : void
      {
         if(this._1L_V_.alpha > 1 || this._1L_V_.alpha < 0)
         {
            this._0L_3 = this._0L_3 * -1;
            if(this._1L_V_.alpha > 1)
            {
               this._0H_0--;
               if(!this._0H_0)
               {
                  this._1zr = false;
                  this.color_ = this._C_4;
                  this._it = this._0fp;
                  this._1L_V_.alpha = 1;
                  this._0P_5();
                  removeEventListener(Event.ENTER_FRAME,this._06C_);
               }
            }
         }
         this._1L_V_.alpha = this._1L_V_.alpha + this.speed * this._0L_3;
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._0K_Q_ = true;
         this._0P_5();
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._0K_Q_ = false;
         this._0P_5();
      }
   }
}
