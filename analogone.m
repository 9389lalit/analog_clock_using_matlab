
setfigureproperties;
hh1=[ ];
hm1=[ ];
hs1=[ ];
global rs;
rs=10;
while 3 
    time=datetime('now');
    update_clock1(time);
    pause(1);
end

function update_clock1(time)
global hh1 hm1 hs1 rs;
thsec = 90+fix(time.Second)*6;
thmin = 90+(time.Minute*6) + (time.Second/10);
thhour = 90+(time.Hour*30) + (time.Minute/2); %thsec-thetasec
delete(hh1);   
hh1  = plot([0.1*rs*cosd(thhour) -0.75*rs*cosd(thhour)],...
                                              [-0.1*rs*sind(thhour) 0.75*rs*sind(thhour)],'r','LineWidth',1.75);
 delete(hm1);  
 hm1 = plot([0 -0.9*rs*cosd(thmin)],[0 0.9*rs*sind(thmin)],'k','LineWidth',1.5);
delete(hs1);  
hs1  = plot([0 -rs*cosd(thsec)],[0 rs*sind(thsec)],'Color',[1 0 0],'LineWidth',1);
end

function setfigureproperties
global cc;
cc=figure('units','pixels',...
            'menubar','none',...
            'name','clockplot',...
            'numbertitle','off',...
            'renderer','opengl',...
            'visible','on',...
            'color',[1 0.9 0.7],...
            'CloseRequestFcn', @stl_CloseReqFcn);
    subplot(1,1,1),
    draw_clock;
    title('Present time','FontSize',15);
end

function draw_clock

axis off,hold on
drawcircle(1,12)
for n=1:12
    text(-8.5*cosd(90+(n)*360/12),8.5*sind(90+(n)*360/12),num2str(n))
    plot([0.95*10*cosd(90+(n)*360/12) 1.1*10*cosd(90+(n)*360/12)],...
        [0.95*10*sind(90+(n)*360/12) 1.1*10*sind(90+(n)*360/12)],...
        'k','LineWidth',2)
    for ns=1:5
        plot([1.0*10*cosd(90+(n)*360/12+6*ns) 1.1*10*cosd(90+(n)*360/12+6*ns)],...
            [1.0*10*sind(90+(n)*360/12+6*ns) 1.1*10*sind(90+(n)*360/12+6*ns)],...
            'k','LineWidth',1)
    end
end
axis([-14 14 -15 15]);
end

function drawcircle(varargin)

th=0:6:360;
for n=1:nargin
    if varargin{n}==max(varargin{:})
        plot(varargin{n}*cosd(th),varargin{n}*sind(th),'LineWidth',6);
         plot((varargin{n}+0.8)*cosd(th),(varargin{n}+0.8)*sind(th),'r','LineWidth',6);
    elseif varargin{n}==min(varargin{:})
        fill(varargin{n}*cosd(th),varargin{n}*sind(th),'b')
    else
        plot(varargin{n}*cosd(th),varargin{n}*sind(th),'k')
    end
end
end

  