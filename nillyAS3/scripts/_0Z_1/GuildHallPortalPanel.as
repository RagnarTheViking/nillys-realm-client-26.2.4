package _0Z_1
{
   import _05g._1S_m;
   import com.company.assembleegameclient.util._A_o;
   import com.company.assembleegameclient.objects.GuildHallPortal;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import com.company.assembleegameclient.objects.Player;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   
   public class GuildHallPortalPanel extends Panel
   {
       
      
      private const _01T_:_1S_m = new _1S_m();
      
      public var _1gH_:_A_o;
      
      private var _1od:GuildHallPortal;
      
      private var nameText_:SimpleText;
      
      private var _Y_A_:Button;
      
      private var _7z:SimpleText;
      
      public function GuildHallPortalPanel(param1:GameSpriteBase, param2:GuildHallPortal)
      {
         var _loc3_:Player = null;
         super(param1);
         this._1gH_ = new _A_o(this);
         this._1od = param2;
         if(gs_.map == null || gs_.map.player_ == null)
         {
            return;
         }
         _loc3_ = gs_.map.player_;
         this.nameText_ = new SimpleText().setSize(18).setColor(16777215).setTextWidth(WIDTH).setWordWrap(true).setMultiLine(true).setAutoSize(TextFieldAutoSize.CENTER).setBold(true).setHTML(true);
         this.nameText_.setStringBuilder(new _dU_().setParams(_1O_I_._0mB_).setPrefix("<p align=\"center\">").setPostfix("</p>"));
         this.nameText_.filters = [new DropShadowFilter(0,0,0)];
         this.nameText_.y = 6;
         addChild(this.nameText_);
         if(_loc3_.guildName_ != null && _loc3_.guildName_.length > 0)
         {
            this._Y_A_ = new Button(16,_1O_I_._1k8);
            this._Y_A_.addEventListener(MouseEvent.CLICK,this._13x);
            addChild(this._Y_A_);
            this._01T_.push(this._Y_A_.textChanged);
            addEventListener(Event.ADDED_TO_STAGE,this._0r0);
         }
         else
         {
            this._7z = new SimpleText().setSize(18).setColor(16711680).setTextWidth(WIDTH).setAutoSize(TextFieldAutoSize.CENTER).setHTML(true).setBold(true);
            this._7z.setStringBuilder(new _dU_().setParams(_1O_I_._V_u).setPrefix("<p align=\"center\">").setPostfix("</p>"));
            this._7z.filters = [new DropShadowFilter(0,0,0)];
            this._01T_.push(this._7z.textChanged);
            addChild(this._7z);
         }
         this._01T_.complete.addOnce(this.alignUI);
      }
      
      private function alignUI() : void
      {
         if(this._7z)
         {
            this._7z.y = HEIGHT - this._7z.height - 12;
         }
         if(this._Y_A_)
         {
            this._Y_A_.x = WIDTH / 2 - this._Y_A_.width / 2;
            this._Y_A_.y = HEIGHT - this._Y_A_.height - 4;
         }
      }
      
      private function _0r0(param1:Event) : void
      {
         this._1gH_.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         addEventListener(Event.REMOVED_FROM_STAGE,this._014);
      }
      
      private function _014(param1:Event) : void
      {
         this._1gH_.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function _13x(param1:MouseEvent) : void
      {
         this.enterPortal();
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Parameters.data_.interact && stage.focus == null)
         {
            this.enterPortal();
         }
      }
      
      private function enterPortal() : void
      {
         gs_.gsc_.usePortal(this._1od.objectId_);
      }
   }
}
