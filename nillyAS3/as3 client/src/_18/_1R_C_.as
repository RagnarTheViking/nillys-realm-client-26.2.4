package _18
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import ToolTips._0bd;
   import _1S_0._1mh;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import _1xa._dU_;
   import _1xa.SText;
   import flash.events.MouseEvent;
   
   public class _1R_C_ extends Sprite
   {
       
      
      public var _Z_w:String;
      
      public var description_:String;
      
      public var nameText_:SimpleText;
      
      public var _1rw:SimpleText;
      
      public var _for:Boolean;
      
      public var val_:int = -1;
      
      public var boost_:int = -1;
      
      public var _078:uint = 11776947;
      
      public var toolTip_:_0bd;
      
      public var _aV_:_1mh;
      
      public var _1xg:_1mh;
      
      public function _1R_C_(param1:String, param2:String, param3:String, param4:Boolean)
      {
         this.toolTip_ = new _0bd(3552822,10197915,"","",200);
         super();
         this._Z_w = param2;
         this.description_ = param3;
         this.nameText_ = new SimpleText().setSize(13).setColor(11776947);
         this.nameText_.setStringBuilder(new _dU_().setParams(param1));
         this._Q_v(this.nameText_);
         this._1rw = new SimpleText().setSize(13).setColor(this._078).setBold(true);
         this._1rw.setStringBuilder(new SText("-"));
         this._Q_v(this._1rw);
         this._for = param4;
         this._aV_ = new _1mh(this,MouseEvent.MOUSE_OVER,MouseEvent);
         this._1xg = new _1mh(this,MouseEvent.MOUSE_OUT,MouseEvent);
      }
      
      public function _Q_v(param1:SimpleText) : void
      {
         param1.setAutoSize(TextFieldAutoSize.LEFT);
         param1.filters = [new DropShadowFilter(0,0,0)];
         addChild(param1);
      }
      
      public function _1B_u() : void
      {
         this.toolTip_.setTitle(new _dU_().setParams(this._Z_w));
         this.toolTip_._0D_S_(new _dU_().setParams(this.description_));
         if(!stage.contains(this.toolTip_))
         {
            stage.addChild(this.toolTip_);
         }
      }
      
      public function _O_t() : void
      {
         if(this.toolTip_.parent != null)
         {
            this.toolTip_.parent.removeChild(this.toolTip_);
         }
      }
      
      public function draw(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:uint = 0;
         if(param1 == this.val_ && param2 == this.boost_)
         {
            return;
         }
         this.val_ = param1;
         this.boost_ = param2;
         if(param1 - param2 >= param3)
         {
            _loc4_ = 16572160;
         }
         else if(this._for && this.val_ <= 0 || this.boost_ < 0)
         {
            _loc4_ = 16726072;
         }
         else if(this.boost_ > 0)
         {
            _loc4_ = 6206769;
         }
         else
         {
            _loc4_ = 11776947;
         }
         if(this._078 != _loc4_)
         {
            this._078 = _loc4_;
            this._1rw.setColor(this._078);
         }
         var _loc5_:String = this.val_.toString();
         if(this.boost_ != 0)
         {
            _loc5_ = _loc5_ + (" (" + (this.boost_ > 0?"+":"") + this.boost_.toString() + ")");
         }
         this._1rw.setStringBuilder(new SText(_loc5_));
         this._1rw.x = this.nameText_.getBounds(this).right;
      }
   }
}
