package _05g
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1jl._1fv;
   import com.company.assembleegameclient.objects._1D_v;
   import flash.display.Bitmap;
   import _1jl.IconButton;
   import _1gF_.SimpleText;
   import _1S_0._1mh;
   import com.company.assembleegameclient.ui._1A_O_;
   import com.company.assembleegameclient.ui._0ed;
   import _C_._1O_I_;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import com.company.assembleegameclient.objects.Player;
   import _1xa.SText;
   
   public class CharacterDetailsView extends Sprite
   {
      
      public static const NEXUS_BUTTON:String = "NEXUS_BUTTON";
      
      public static const OPTIONS_BUTTON:String = "OPTIONS_BUTTON";
      
      public static const _qv:String = "lofiInterfaceBig";
      
      public static const _C_a:int = 6;
      
      public static const _Q_o:int = 5;
       
      
      public var _0qj:Signal;
      
      public var _0E_D_:Signal;
      
      public var _C_p:_1fv;
      
      public var _F_C_:_1D_v;
      
      private var _0P_q:Bitmap;
      
      private var button:IconButton;
      
      private var nameText_:SimpleText;
      
      private var _1M_t:_1mh;
      
      private var _1N_2:_1mh;
      
      private var _1C_S_:_1A_O_;
      
      private var _04i:_0ed;
      
      public function CharacterDetailsView()
      {
         this._0qj = new Signal();
         this._0E_D_ = new Signal();
         this._0P_q = new Bitmap(null);
         this.nameText_ = new SimpleText().setSize(20).setColor(11776947);
         this._1M_t = new _1mh(this.button,MouseEvent.CLICK);
         this._1N_2 = new _1mh(this.button,MouseEvent.CLICK);
         super();
      }
      
      public function init(param1:String, param2:String) : void
      {
         this._uT_();
         this._01F_(param1);
         this._0wl(param2);
      }
      
      private function _0wl(param1:String) : void
      {
         if(param1 == NEXUS_BUTTON)
         {
            this.button = this._C_p.create(this._F_C_._0H_9(_qv,_C_a),_1O_I_._0T_Y_,"escapeToNexus");
            this._1M_t = new _1mh(this.button,MouseEvent.CLICK,MouseEvent);
            this._1M_t.add(this._G_o);
         }
         else if(param1 == OPTIONS_BUTTON)
         {
            this.button = this._C_p.create(this._F_C_._0H_9(_qv,_Q_o),_1O_I_._7K_,"options");
            this._1N_2 = new _1mh(this.button,MouseEvent.CLICK,MouseEvent);
            this._1N_2.add(this._c0);
         }
         this.button.x = 172;
         this.button.y = 4;
         addChild(this.button);
      }
      
      private function _uT_() : void
      {
         this._0P_q.x = -2;
         this._0P_q.y = -8;
         addChild(this._0P_q);
      }
      
      private function _01F_(param1:String) : void
      {
         this.nameText_.setBold(true);
         this.nameText_.x = 36;
         this.nameText_.y = 3;
         this.nameText_.filters = [new DropShadowFilter(0,0,0)];
         this.setName(param1);
         addChild(this.nameText_);
      }
      
      public function update(param1:Player) : void
      {
         this._0P_q.bitmapData = param1.getPortrait();
      }
      
      public function draw(param1:Player) : void
      {
         if(this._04i)
         {
            this._04i.update(param1.xpBoostTime_);
         }
         if(param1.lootTierTime_ || param1.dropRateTime_)
         {
            this._1C_S_ = this._1C_S_ || new _1A_O_(param1);
            if(this._0P_q)
            {
               this._0P_q.x = 13;
            }
            if(this.nameText_)
            {
               this.nameText_.x = 47;
            }
            this._1C_S_.x = 6;
            this._1C_S_.y = 5;
            addChild(this._1C_S_);
         }
         else if(this._1C_S_)
         {
            removeChild(this._1C_S_);
            this._1C_S_ = null;
            this._0P_q.x = -2;
            this.nameText_.x = 36;
         }
      }
      
      private function _G_o(param1:MouseEvent) : void
      {
         this._0qj.dispatch();
      }
      
      private function _c0(param1:MouseEvent) : void
      {
         this._0E_D_.dispatch();
      }
      
      public function setName(param1:String) : void
      {
         this.nameText_.setStringBuilder(new SText(param1));
      }
   }
}
