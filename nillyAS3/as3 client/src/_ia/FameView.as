package _ia
{
   import flash.display.Sprite;
   import _f7.Signal;
   import flash.display.DisplayObjectContainer;
   import flash.display.Bitmap;
   import _1gF_.SimpleText;
   import _W_Q_._1kn;
   import _W_Q_._0G_K_;
   import _W_Q_.TextButton;
   import flash.display.BitmapData;
   import _T_J_.GTween;
   import _ll.SFX;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _1xa._dU_;
   import _C_._1O_I_;
   import com.company.rotmg.graphics.FameIconBackgroundDesign;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.util.Star;
   import com.company.util.BitmapUtil;
   import com.company.rotmg.graphics.ScreenGraphic;
   import _ju._0O_M_;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   
   public class FameView extends Sprite
   {
       
      
      public var closed:Signal;
      
      private var _1wq:DisplayObjectContainer;
      
      private var _eU_:Bitmap;
      
      private var title:SimpleText;
      
      private var date:SimpleText;
      
      private var _dT_:_1kn;
      
      private var _07q:_0G_K_;
      
      private var _0L_m:TextButton;
      
      private var _02f:Boolean;
      
      private var _R_u:Boolean;
      
      private var _0A_t:Boolean;
      
      public function FameView()
      {
         super();
         addChild(new _0O_M_());
         addChild(this._1wq = new Sprite());
         addChild(this._eU_ = new Bitmap());
         this._0L_m = new TextButton(_1O_I_._064,36,false);
         this._0L_m.setAutoSize(TextFieldAutoSize.CENTER);
         this._0L_m.setVerticalAlign(SimpleText.MIDDLE);
         this.closed = new NativeMappedSignal(this._0L_m,MouseEvent.CLICK);
      }
      
      public function _1U_0(param1:Boolean) : void
      {
         this._02f = param1;
      }
      
      public function _04o(param1:BitmapData) : void
      {
         this._eU_.bitmapData = param1;
         var _loc2_:GTween = new GTween(this._eU_,2,{"alpha":0});
         _loc2_.onComplete = this._0lM_;
         SFX.play("death_screen");
      }
      
      public function _0Q_P_() : void
      {
         this._eU_.bitmapData = null;
      }
      
      private function _0lM_(param1:GTween) : void
      {
         removeChild(this._eU_);
         this._R_u = true;
         if(this._0A_t)
         {
            this._0rd();
         }
      }
      
      public function _1Q_s(param1:String, param2:int, param3:int) : void
      {
         this.title = new SimpleText().setSize(38).setColor(13421772);
         this.title.setBold(true).setAutoSize(TextFieldAutoSize.CENTER);
         this.title.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         var _loc4_:String = ObjectLibrary._O_S_[param3];
         this.title.setStringBuilder(new _dU_().setParams(_1O_I_._1B_p,{
            "name":param1,
            "level":param2,
            "type":_loc4_
         }));
         stage;
         this.title.x = 800 / 2;
         this.title.y = 225;
         this._1wq.addChild(this.title);
      }
      
      public function _0S_b(param1:String, param2:String) : void
      {
         this.date = new SimpleText().setSize(24).setColor(13421772);
         this.date.setBold(true).setAutoSize(TextFieldAutoSize.CENTER);
         this.date.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         var _loc3_:_dU_ = new _dU_();
         if(param2)
         {
            _loc3_.setParams(_1O_I_._0I_J_,{
               "date":param1,
               "killer":param2
            });
         }
         else
         {
            _loc3_.setParams(_1O_I_._0D_u,{"date":this.date});
         }
         this.date.setStringBuilder(_loc3_);
         stage;
         this.date.x = 800 / 2;
         this.date.y = 272;
         this._1wq.addChild(this.date);
      }
      
      public function setIcon(param1:BitmapData) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Bitmap = null;
         var _loc4_:Sprite = null;
         _loc2_ = new Sprite();
         _loc4_ = new FameIconBackgroundDesign();
         _loc4_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         _loc2_.addChild(_loc4_);
         _loc3_ = new Bitmap(param1);
         _loc3_.x = _loc2_.width / 2 - _loc3_.width / 2;
         _loc3_.y = _loc2_.height / 2 - _loc3_.height / 2;
         _loc2_.addChild(_loc3_);
         _loc2_.y = 20;
         stage;
         _loc2_.x = 800 / 2 - _loc2_.width / 2;
         this._1wq.addChild(_loc2_);
      }
      
      public function _0Y_A_(param1:int, param2:XML) : void
      {
         this._dT_ = new _1kn(new Rectangle(0,0,784,150),param2);
         this._dT_.x = 8;
         this._dT_.y = 316;
         addChild(this._dT_);
         this._1wq.addChild(this._dT_);
         var _loc3_:BitmapData = Star._0a__();
         _loc3_ = BitmapUtil._0P_V_(_loc3_,6,6,_loc3_.width - 12,_loc3_.height - 12);
         this._07q = new _0G_K_(24,13421772,16762880,_1O_I_._12I_,null,0,param1,"","",new Bitmap(_loc3_));
         this._07q.x = 10;
         this._07q.y = 470;
         this._1wq.addChild(this._07q);
         this._0A_t = true;
         if(!this._02f || this._R_u)
         {
            this._0rd();
         }
      }
      
      private function _0rd() : void
      {
         this._1wq.addChild(new ScreenGraphic());
         stage;
         this._0L_m.x = 800 / 2;
         this._0L_m.y = 550;
         this._1wq.addChild(this._0L_m);
         if(this._02f)
         {
            this._dT_._1Z_Y_();
         }
         else
         {
            this._dT_._0V_o();
         }
      }
   }
}
