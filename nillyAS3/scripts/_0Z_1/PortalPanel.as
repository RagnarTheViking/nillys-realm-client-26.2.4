package _0Z_1
{
   import _f7.Signal;
   import _05g._1S_m;
   import com.company.assembleegameclient.objects.Portal;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.KeyboardEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.googleanalytics.GA;
   import com.company.assembleegameclient.tutorial.doneAction;
   import com.company.assembleegameclient.tutorial.Tutorial;
   import com.company.assembleegameclient.objects._0iZ_;
   import _1xa._1eo;
   import com.company.assembleegameclient.game.GameSprite;
   import flash.text.TextFormatAlign;
   import flash.filters.DropShadowFilter;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   
   public class PortalPanel extends Panel
   {
       
      
      private const LOCKED:String = "Locked ";
      
      private const _1xx:RegExp = /\{"text":"(.+)"}/;
      
      public const _S_J_:Signal = new Signal();
      
      private const _01T_:_1S_m = new _1S_m();
      
      public var _1od:Portal;
      
      private var nameText_:SimpleText;
      
      private var _Y_A_:Button;
      
      private var _R_j:SimpleText;
      
      public function PortalPanel(param1:GameSprite, param2:Portal)
      {
         super(param1);
         this._1od = param2;
         this.nameText_ = new SimpleText().setSize(18).setColor(16777215).setBold(true).setTextWidth(WIDTH).setHorizontalAlign(TextFormatAlign.CENTER);
         this.nameText_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.nameText_);
         this._01T_.push(this.nameText_.textChanged);
         this._Y_A_ = new Button(16,_1O_I_._1k8);
         addChild(this._Y_A_);
         this._01T_.push(this._Y_A_.textChanged);
         this._R_j = new SimpleText().setSize(18).setColor(16711680).setHTML(true).setBold(true).setAutoSize(TextFieldAutoSize.CENTER);
         var _loc3_:String = !!this._1od._0Z_9?_1O_I_._ec:_1O_I_._0ae;
         this._R_j.setStringBuilder(new _dU_().setParams(_loc3_).setPrefix("<p align=\"center\">").setPostfix("</p>"));
         this._R_j.filters = [new DropShadowFilter(0,0,0)];
         this._R_j.textChanged.addOnce(this.alignUI);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._01T_.complete.addOnce(this.alignUI);
      }
      
      private function alignUI() : void
      {
         this.nameText_.y = 6;
         this._Y_A_.x = WIDTH / 2 - this._Y_A_.width / 2;
         this._Y_A_.y = HEIGHT - this._Y_A_.height - 4;
         this._R_j.y = HEIGHT - 30;
         this._R_j.x = WIDTH / 2;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this._Y_A_.addEventListener(MouseEvent.CLICK,this._13x);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
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
         var _loc1_:String = ObjectLibrary._O_S_[this._1od.objectType_];
         if(_loc1_ == "Nexus Portal")
         {
            GA.global().trackEvent("enterPortal",_loc1_);
         }
         else
         {
            GA.global().trackEvent("enterPortal",this._1od.getName());
         }
         doneAction(gs_,Tutorial._1Y_i);
         gs_.gsc_.usePortal(this._1od.objectId_);
         this._S_J_.dispatch();
      }
      
      override public function draw() : void
      {
         this._04l();
         if(!this._1od._0Z_9 && this._1od.usable_ && contains(this._R_j))
         {
            removeChild(this._R_j);
            addChild(this._Y_A_);
         }
         else if((this._1od._0Z_9 || !this._1od.usable_) && contains(this._Y_A_))
         {
            removeChild(this._Y_A_);
            addChild(this._R_j);
         }
      }
      
      private function _04l() : void
      {
         var _loc1_:String = this.getName();
         var _loc2_:_1eo = new _0iZ_().makeBuilder(_loc1_);
         this.nameText_.setStringBuilder(_loc2_);
         this.nameText_.x = (WIDTH - this.nameText_.width) * 0.5;
         this.nameText_.y = this.nameText_.height > 30?Number(0):Number(6);
      }
      
      private function getName() : String
      {
         var _loc1_:String = this._1od.getName();
         if(this._1od._0Z_9 && _loc1_.indexOf(this.LOCKED) == 0)
         {
            return _loc1_.substr(this.LOCKED.length);
         }
         return this._0yO_(_loc1_);
      }
      
      private function _0yO_(param1:String) : String
      {
         var _loc2_:Array = param1.match(this._1xx);
         return !!_loc2_?_loc2_[1]:param1;
      }
   }
}
