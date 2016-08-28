package _W_Q_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import flash.display.Bitmap;
   import com.company.ui._0H_R_;
   import flash.events.MouseEvent;
   import flash.net.navigateToURL;
   import flash.net.URLRequest;
   import flash.display.BitmapData;
   import flash.filters.DropShadowFilter;
   
   public class _oG_ extends Sprite
   {
      
      public static const WIDTH:int = 415;
      
      public static const HEIGHT:int = 52;
      
      public static const _2Y_:uint = 11776947;
      
      public static const _1ob:uint = 16762880;
       
      
      public var _1A_4:Signal;
      
      public var _1kE_:Bitmap;
      
      public var _7H_:_0H_R_;
      
      public var taglineText_:_0H_R_;
      
      public var _cu:_0H_R_;
      
      public var link:String;
      
      public var accountId:String;
      
      public function _oG_(param1:BitmapData, param2:String, param3:String, param4:String, param5:int, param6:String)
      {
         this._1A_4 = new Signal(int);
         super();
         this.link = param4;
         this.accountId = param6;
         buttonMode = true;
         useHandCursor = true;
         tabEnabled = false;
         this._1kE_ = new Bitmap();
         this._1kE_.bitmapData = param1;
         this._1kE_.x = 12;
         this._1kE_.y = HEIGHT / 2 - param1.height / 2 - 3;
         addChild(this._1kE_);
         this._7H_ = new _0H_R_(18,_2Y_,false,0,0);
         this._7H_.text = param2;
         this._7H_.updateMetrics();
         this._7H_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._7H_.x = 73;
         addChild(this._7H_);
         this.taglineText_ = new _0H_R_(14,_2Y_,false,0,0);
         this.taglineText_.text = param3;
         this.taglineText_.updateMetrics();
         this.taglineText_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this.taglineText_.x = 73;
         this.taglineText_.y = 24;
         addChild(this.taglineText_);
         this._cu = new _0H_R_(16,_2Y_,false,0,0);
         this._cu.text = this._0Z_g(param5);
         this._cu.updateMetrics();
         this._cu.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._cu.x = WIDTH - this._cu.width;
         addChild(this._cu);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         this._7H_.setColor(_1ob);
         this.taglineText_.setColor(_1ob);
         this._cu.setColor(_1ob);
      }
      
      protected function onRollOut(param1:MouseEvent) : void
      {
         this._7H_.setColor(_2Y_);
         this.taglineText_.setColor(_2Y_);
         this._cu.setColor(_2Y_);
      }
      
      protected function onMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:Array = this.link.split(":",2);
         switch(_loc2_[0])
         {
            case "fame":
               this._1A_4.dispatch(int(_loc2_[1]));
               return;
            case "http":
            case "https":
            default:
               navigateToURL(new URLRequest(this.link),"_blank");
               return;
         }
      }
      
      private function _0Z_g(param1:int) : String
      {
         var _loc2_:Number = new Date().getTime() / 1000;
         var _loc3_:int = _loc2_ - param1;
         if(_loc3_ <= 0)
         {
            return "now";
         }
         if(_loc3_ < 60)
         {
            return _loc3_ + " secs";
         }
         if(_loc3_ < 60 * 60)
         {
            return int(_loc3_ / 60) + " mins";
         }
         if(_loc3_ < 60 * 60 * 24)
         {
            return int(_loc3_ / (60 * 60)) + " hours";
         }
         return int(_loc3_ / (60 * 60 * 24)) + " days";
      }
   }
}
